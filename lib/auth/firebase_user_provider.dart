import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TudushkaFirebaseUser {
  TudushkaFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

TudushkaFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TudushkaFirebaseUser> tudushkaFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TudushkaFirebaseUser>(
      (user) {
        currentUser = TudushkaFirebaseUser(user);
        return currentUser!;
      },
    );
