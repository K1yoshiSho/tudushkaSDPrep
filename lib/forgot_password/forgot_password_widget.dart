import '../auth/auth_util.dart';
import '../custom/custom_icon_button.dart';
import '../custom/custom_theme.dart';
import '../custom/custom_util.dart';
import '../custom/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  _ForgotPasswordWidgetState createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  TextEditingController? emailAddressController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
  }

  @override
  void dispose() {
    emailAddressController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: customTheme.of(context).primaryBackground,
      appBar: responsiveVisibility(
        context: context,
        desktop: false,
      )
          ? PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: AppBar(
                backgroundColor: customTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: CustomIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 50,
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: customTheme.of(context).primaryText,
                                  size: 24,
                                ),
                                onPressed: () async {
                                  context.pop();
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: Text(
                                'Назад',
                                style: customTheme.of(context).title1.override(
                                      fontFamily: 'Nunito',
                                      fontSize: 16,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: Text(
                          'Восстановление пароля',
                          style: customTheme.of(context).title1.override(
                                fontFamily: 'Nunito',
                                fontSize: 25,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ],
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 0,
              ),
            )
          : null,
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                      child: Text(
                        'Мы отправим вам письмо со ссылкой для сброса пароля, пожалуйста, введите e-mail адрес',
                        style: customTheme.of(context).bodyText2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: customTheme.of(context).secondaryBackground,
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
                            labelText: 'E-mail адрес',
                            hintText: 'Введите свой e-mail здесь',
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
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 0, 24),
                            prefixIcon: Icon(
                              Icons.alternate_email_rounded,
                              color: customTheme.of(context).textFIcon,
                            ),
                          ),
                          style: customTheme.of(context).bodyText1.override(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Поле обязательно к заполнению';
                            }

                            if (val.length < 4) {
                              return 'Минимум - 4';
                            }
                            if (val.length > 15) {
                              return 'Максимум - 15';
                            }
                            if (!RegExp(kTextValidatorEmailRegex)
                                .hasMatch(val)) {
                              return 'Введите корректный e-mail адрес';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (emailAddressController!.text != null &&
                      emailAddressController!.text != '') {
                    if (emailAddressController!.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Поле e-mail обязателен к заполнению.',
                          ),
                        ),
                      );
                      return;
                    }
                    await resetPassword(
                      email: emailAddressController!.text,
                      context: context,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Письмо со ссылкой для сброса успешно отправлен на почту :D',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: customTheme.of(context).primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor:
                            customTheme.of(context).primaryBackground,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Пожалуйста введите e-mail адрес.',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: customTheme.of(context).primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor:
                            customTheme.of(context).primaryBackground,
                      ),
                    );
                  }
                },
                text: 'Отправить ссылку',
                icon: FaIcon(
                  FontAwesomeIcons.link,
                  size: 20,
                ),
                options: FFButtonOptions(
                  height: 50,
                  color: customTheme.of(context).primaryColor,
                  textStyle: customTheme.of(context).subtitle2.override(
                        fontFamily: 'Nunito',
                        color: Colors.white,
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
            ),
          ],
        ),
      ),
    );
  }
}
