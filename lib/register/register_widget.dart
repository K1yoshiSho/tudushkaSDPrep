import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../custom/custom_theme.dart';
import '../custom/custom_util.dart';
import '../custom/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController? emailAddressController;
  TextEditingController? nameController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
  TextEditingController? rePasswordController;

  late bool rePasswordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    rePasswordController = TextEditingController();
    rePasswordVisibility = false;
  }

  @override
  void dispose() {
    emailAddressController?.dispose();
    nameController?.dispose();
    passwordController?.dispose();
    rePasswordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: customTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/Tudushka.svg',
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                '??????????????',
                                style: customTheme
                                    .of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Nunito',
                                      color:
                                          customTheme.of(context).primaryColor,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '?????????? ????????????????????!',
                    style: customTheme.of(context).title1.override(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      '?????????????????? ?????????????????????? ???????? ?????????? ?????????? ?????????????? ??????????????.',
                      style: customTheme.of(context).bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    customTheme.of(context).secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x11000000),
                                    offset: Offset(0, 0),
                                    spreadRadius: 1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: TextFormField(
                                controller: emailAddressController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'E-mail ??????????',
                                  hintText: '?????????????? e-mail ??????????',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          customTheme.of(context).googleButton,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          customTheme.of(context).googleButton,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor:
                                      customTheme.of(context).primaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 0, 24),
                                  prefixIcon: Icon(
                                    Icons.alternate_email_rounded,
                                    color: customTheme.of(context).textFIcon,
                                  ),
                                ),
                                style:
                                    customTheme.of(context).bodyText1.override(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  customTheme.of(context).secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x11000000),
                                  offset: Offset(0, 0),
                                  spreadRadius: 1,
                                )
                              ],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: TextFormField(
                              controller: nameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: '??????',
                                hintText: '?????????????? ?????? ??????????',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: customTheme.of(context).googleButton,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: customTheme.of(context).googleButton,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor:
                                    customTheme.of(context).primaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 24, 24),
                                prefixIcon: Icon(
                                  Icons.person_rounded,
                                  color: customTheme.of(context).textFIcon,
                                  size: 24,
                                ),
                              ),
                              style: customTheme.of(context).bodyText1.override(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  customTheme.of(context).secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x11000000),
                                  offset: Offset(0, 0),
                                  spreadRadius: 1,
                                )
                              ],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: !passwordVisibility,
                              decoration: InputDecoration(
                                labelText: '????????????',
                                hintText: '?????????????? ???????????? ??????????',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: customTheme.of(context).googleButton,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: customTheme.of(context).googleButton,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor:
                                    customTheme.of(context).primaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 24, 24),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: customTheme.of(context).textFIcon,
                                  size: 20,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => passwordVisibility =
                                        !passwordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: customTheme.of(context).textFIcon,
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: customTheme.of(context).bodyText1.override(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  customTheme.of(context).secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Color(0x11000000),
                                  offset: Offset(0, 0),
                                  spreadRadius: 1,
                                )
                              ],
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: TextFormField(
                              controller: rePasswordController,
                              obscureText: !rePasswordVisibility,
                              decoration: InputDecoration(
                                labelText: '????????????',
                                hintText: '?????????????? ???????????? ?????? ??????',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: customTheme.of(context).googleButton,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: customTheme.of(context).googleButton,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor:
                                    customTheme.of(context).primaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 24, 24),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: customTheme.of(context).textFIcon,
                                  size: 20,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => rePasswordVisibility =
                                        !rePasswordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    rePasswordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: customTheme.of(context).textFIcon,
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: customTheme.of(context).bodyText1.override(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            if (passwordController?.text !=
                                rePasswordController?.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '???????????? ???? ??????????????????!',
                                  ),
                                ),
                              );
                              return;
                            }

                            final user = await createAccountWithEmail(
                              context,
                              emailAddressController!.text,
                              passwordController!.text,
                            );
                            if (user == null) {
                              return;
                            }

                            final userCreateData = createUserRecordData(
                              createdTime: getCurrentTimestamp,
                              displayName: nameController!.text,
                            );
                            await UserRecord.collection
                                .doc(user.uid)
                                .update(userCreateData);

                            context.goNamedAuth(
                              'home',
                              mounted,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.bottomToTop,
                                  duration: Duration(milliseconds: 400),
                                ),
                              },
                            );
                          },
                          text: '????????????????????????????????????',
                          options: FFButtonOptions(
                            width: 250,
                            height: 50,
                            color: customTheme.of(context).primaryColor,
                            textStyle:
                                customTheme.of(context).subtitle1.override(
                                      fontFamily: 'Nunito',
                                      color: Colors.white,
                                      fontSize: 16,
                                      useGoogleFonts: false,
                                    ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '?? ?????? ?????? ???????? ???????????????',
                          style: customTheme.of(context).bodyText1.override(
                                fontFamily: 'Nunito',
                                color: customTheme.of(context).secondaryText,
                                fontSize: 16,
                                useGoogleFonts: false,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(
                              'login',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          text: '??????????',
                          options: FFButtonOptions(
                            width: 160,
                            height: 40,
                            color: customTheme.of(context).primaryBackground,
                            textStyle: customTheme
                                .of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Nunito',
                                  color: customTheme.of(context).primaryColor,
                                  useGoogleFonts: false,
                                ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: customTheme.of(context).primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
