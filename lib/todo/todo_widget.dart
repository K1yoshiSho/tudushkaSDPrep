import '../custom/custom_icon_button.dart';
import '../custom/custom_theme.dart';
import '../custom/custom_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: customTheme.of(context).primaryBackground,
      appBar: responsiveVisibility(
        context: context,
        desktop: false,
      )
          ? AppBar(
              backgroundColor: customTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () async {
                              context.goNamed(
                                'home',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/images/Tudushka.svg',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              'Задачник',
                              style: customTheme.of(context).title2.override(
                                    fontFamily: 'Nunito',
                                    color: customTheme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 45,
                            icon: FaIcon(
                              FontAwesomeIcons.questionCircle,
                              color: customTheme.of(context).primaryColor,
                              size: 25,
                            ),
                            onPressed: () async {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'В разработке',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color:
                                          customTheme.of(context).primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      customTheme.of(context).primaryBackground,
                                ),
                              );
                            },
                          ),
                          CustomIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 45,
                            icon: FaIcon(
                              FontAwesomeIcons.ellipsisV,
                              color: customTheme.of(context).primaryColor,
                              size: 25,
                            ),
                            onPressed: () async {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'В разработке',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color:
                                          customTheme.of(context).primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      customTheme.of(context).primaryBackground,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 0,
            )
          : null,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'В разработке',
            textAlign: TextAlign.center,
            style: customTheme.of(context).bodyText1.override(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.normal,
                  useGoogleFonts: false,
                ),
          ),
        ],
      ),
    );
  }
}
