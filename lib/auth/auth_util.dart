import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../custom/custom_util.dart';

import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stream_transform/stream_transform.dart';
import 'firebase_user_provider.dart';
export 'email_auth.dart';

Future<User?> signInOrCreateAccount(
  BuildContext context,
  Future<UserCredential?> Function() signInFunc,
  String authProvider,
) async {
  try {
    final userCredential = await signInFunc();
    if (userCredential?.user != null) {
      await maybeCreateUser(userCredential!.user!);
    }
    return userCredential?.user;
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ошибка при авторизации.')),
    );
    return null;
  }
}

Future signOut() {
  return FirebaseAuth.instance.signOut();
}

Future deleteUser(BuildContext context) async {
  try {
    if (currentUser?.user == null) {
      print('Error: delete user attempted with no logged in user!');
      return;
    }
    await currentUser?.user?.delete();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'requires-recent-login') {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Too long since most recent sign in. Sign in again before deleting your account.')),
      );
    }
  }
}

Future resetPassword(
    {required String email, required BuildContext context}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ошибка при авторизации.')),
    );
    return null;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Ссылка со сбросом отправлена на вашу почту.')),
  );
}

Future sendEmailVerification() async =>
    currentUser?.user?.sendEmailVerification();

String get currentUserEmail =>
    currentUserDocument?.email ?? currentUser?.user?.email ?? '';

String get currentUserUid => currentUser?.user?.uid ?? '';

String get currentUserDisplayName =>
    currentUserDocument?.displayName ?? currentUser?.user?.displayName ?? '';

String get currentUserPhoto =>
    currentUserDocument?.photoUrl ?? currentUser?.user?.photoURL ?? '';

String get currentPhoneNumber =>
    currentUserDocument?.phoneNumber ?? currentUser?.user?.phoneNumber ?? '';

String get currentJwtToken => _currentJwtToken ?? '';

bool get currentUserEmailVerified {
  if (currentUser?.user != null && !currentUser!.user!.emailVerified) {
    currentUser!.user!
        .reload()
        .then((_) => currentUser!.user = FirebaseAuth.instance.currentUser);
  }
  return currentUser?.user?.emailVerified ?? false;
}

String? _currentJwtToken;
final jwtTokenStream = FirebaseAuth.instance
    .idTokenChanges()
    .map((user) async => _currentJwtToken = await user?.getIdToken())
    .asBroadcastStream();

String? _phoneAuthVerificationCode;

ConfirmationResult? _webPhoneAuthConfirmationResult;

Future beginPhoneAuth({
  required BuildContext context,
  required String phoneNumber,
  required VoidCallback onCodeSent,
}) async {
  if (kIsWeb) {
    _webPhoneAuthConfirmationResult =
        await FirebaseAuth.instance.signInWithPhoneNumber(phoneNumber);
    onCodeSent();
    return;
  }

  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    timeout: Duration(seconds: 5),
    verificationCompleted: (phoneAuthCredential) async {
      await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
    },
    verificationFailed: (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Ошибка при авторизации.'),
      ));
    },
    codeSent: (verificationId, _) {
      _phoneAuthVerificationCode = verificationId;
      onCodeSent();
    },
    codeAutoRetrievalTimeout: (_) {},
  );
}

Future verifySmsCode({
  required BuildContext context,
  required String smsCode,
}) async {
  if (kIsWeb) {
    return signInOrCreateAccount(
      context,
      () => _webPhoneAuthConfirmationResult!.confirm(smsCode),
      'PHONE',
    );
  } else {
    final authCredential = PhoneAuthProvider.credential(
        verificationId: _phoneAuthVerificationCode!, smsCode: smsCode);
    return signInOrCreateAccount(
      context,
      () => FirebaseAuth.instance.signInWithCredential(authCredential),
      'PHONE',
    );
  }
}

DocumentReference? get currentUserReference => currentUser?.user != null
    ? UserRecord.collection.doc(currentUser!.user!.uid)
    : null;

UserRecord? currentUserDocument;
final authenticatedUserStream = FirebaseAuth.instance
    .authStateChanges()
    .map<String>((user) => user?.uid ?? '')
    .switchMap(
      (uid) => uid.isEmpty
          ? Stream.value(null)
          : UserRecord.getDocument(UserRecord.collection.doc(uid))
              .handleError((_) {}),
    )
    .map((user) => currentUserDocument = user)
    .asBroadcastStream();

class AuthUserStreamWidget extends StatelessWidget {
  const AuthUserStreamWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: authenticatedUserStream,
        builder: (context, _) => child,
      );
}
