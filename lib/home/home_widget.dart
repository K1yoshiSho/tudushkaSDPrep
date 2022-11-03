import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_goal_widget.dart';
import '../components/empty_widget.dart';
import '../custom/custom_animations.dart';
import '../custom/custom_icon_button.dart';
import '../custom/custom_theme.dart';
import '../custom/custom_util.dart';
import '../custom/custom_widgets.dart';
import '../custom/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  bool bio = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 350.ms,
          begin: Offset(40, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 350.ms,
          begin: Offset(-40, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final local_auth = LocalAuthentication();
      bool _isBiometricSupported = await local_auth.isDeviceSupported();

      if (_isBiometricSupported) {
        bio = await local_auth.authenticate(localizedReason: 'Hello');
        setState(() {});
      }

      if (bio == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Успешно зашли',
              style: TextStyle(
                color: customTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color(0x00000000),
          ),
        );
      } else {
        GoRouter.of(context).prepareAuthEvent();
        await signOut();
      }

      context.goNamedAuth('login', mounted);
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: customTheme.of(context).primaryColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: AddGoalWidget(),
              );
            },
          ).then((value) => setState(() {}));
        },
        backgroundColor: customTheme.of(context).primaryColor,
        icon: Icon(
          Icons.add_circle_rounded,
          color: Colors.white,
        ),
        elevation: 0,
        label: Text(
          'Добавить',
          style: customTheme.of(context).bodyText1.override(
                fontFamily: 'Nunito',
                color: Colors.white,
                fontWeight: FontWeight.normal,
                useGoogleFonts: false,
              ),
        ),
      ),
      drawer: Drawer(
        elevation: 16,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: customTheme.of(context).primaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/Tudushka.svg',
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Тудушка',
                        style: customTheme.of(context).bodyText1.override(
                              fontFamily: 'Nunito',
                              color: customTheme.of(context).primaryColor,
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: Color(0x3F595959),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 0, 22, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (Theme.of(context).brightness == Brightness.light)
                      InkWell(
                        onTap: () async {
                          setDarkModeSetting(context, ThemeMode.dark);
                          if (animationsMap[
                                  'containerOnActionTriggerAnimation2'] !=
                              null) {
                            setState(() => hasContainerTriggered2 = true);
                            SchedulerBinding.instance.addPostFrameCallback(
                                (_) async => await animationsMap[
                                        'containerOnActionTriggerAnimation2']!
                                    .controller
                                    .forward(from: 0.0));
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.adjust,
                                    color: Color(0xFFA4A6A8),
                                    size: 18,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Темный режим',
                                      style: customTheme
                                          .of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Nunito',
                                            color: Color(0xFFA4A6A8),
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0x5CDCDCDC),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional(0, 0),
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.95, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 8, 0),
                                        child: Icon(
                                          Icons.nights_stay,
                                          color: customTheme
                                              .of(context)
                                              .secondaryText,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-0.85, 0),
                                      child: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: customTheme
                                              .of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x430B0D0F),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ).animateOnActionTrigger(
                                          animationsMap[
                                              'containerOnActionTriggerAnimation1']!,
                                          hasBeenTriggered:
                                              hasContainerTriggered1),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (Theme.of(context).brightness == Brightness.dark)
                      InkWell(
                        onTap: () async {
                          setDarkModeSetting(context, ThemeMode.light);
                          if (animationsMap[
                                  'containerOnActionTriggerAnimation1'] !=
                              null) {
                            setState(() => hasContainerTriggered1 = true);
                            SchedulerBinding.instance.addPostFrameCallback(
                                (_) async => await animationsMap[
                                        'containerOnActionTriggerAnimation1']!
                                    .controller
                                    .forward(from: 0.0));
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.adjust,
                                    color: Color(0xFFA4A6A8),
                                    size: 18,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Светлый режим',
                                      style: customTheme
                                          .of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Nunito',
                                            color: Color(0xFFA4A6A8),
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 80,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0x5CDCDCDC),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional(0, 0),
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(-0.9, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 2, 0, 0),
                                        child: Icon(
                                          Icons.wb_sunny_rounded,
                                          color: customTheme
                                              .of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.9, 0),
                                      child: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: customTheme
                                              .of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x430B0D0F),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ).animateOnActionTrigger(
                                          animationsMap[
                                              'containerOnActionTriggerAnimation2']!,
                                          hasBeenTriggered:
                                              hasContainerTriggered2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 0, 22, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.globe,
                                color: Color(0xFFA4A6A8),
                                size: 18,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Text(
                                  'Язык приложения',
                                  style: customTheme
                                      .of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: Color(0xFFA4A6A8),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 0, 22, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.cog,
                                color: Color(0xFFA4A6A8),
                                size: 18,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Text(
                                  'Настройки',
                                  style: customTheme
                                      .of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: Color(0xFFA4A6A8),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 0, 22, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.donate,
                                color: Color(0xFFA4A6A8),
                                size: 18,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Text(
                                  'Пожертвовать',
                                  style: customTheme
                                      .of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: Color(0xFFA4A6A8),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: Color(0x3F595959),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 0, 22, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.shareAlt,
                                color: Color(0xFFA4A6A8),
                                size: 18,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Text(
                                  'Поделиться',
                                  style: customTheme
                                      .of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: Color(0xFFA4A6A8),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 0, 22, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.questionCircle,
                                color: Color(0xFFA4A6A8),
                                size: 18,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Text(
                                  'FAQ',
                                  style: customTheme
                                      .of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: Color(0xFFA4A6A8),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(22, 0, 22, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.mailBulk,
                                color: Color(0xFFA4A6A8),
                                size: 18,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Text(
                                  'Связаться',
                                  style: customTheme
                                      .of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Nunito',
                                        color: Color(0xFFA4A6A8),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: Color(0x3F595959),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  color: Color(0xFFA4A6A8),
                                  size: 24,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    'Оценить нас',
                                    style: customTheme
                                        .of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Nunito',
                                          color: Color(0xFFA4A6A8),
                                          fontSize: 16,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await signOut();

                    context.goNamedAuth('login', mounted);
                  },
                  text: 'Выйти',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: customTheme.of(context).primaryBackground,
                    textStyle: customTheme.of(context).subtitle2.override(
                          fontFamily: 'Nunito',
                          color: customTheme.of(context).primaryColor,
                          useGoogleFonts: false,
                        ),
                    elevation: 0,
                    borderSide: BorderSide(
                      color: customTheme.of(context).primaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 130,
            decoration: BoxDecoration(
              color: customTheme.of(context).primaryColor,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: CustomIconButton(
                          borderRadius: 30,
                          buttonSize: 44,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.menu_rounded,
                            color: customTheme.of(context).primaryColor,
                            size: 24,
                          ),
                          onPressed: () async {
                            scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Привет,',
                              style: customTheme.of(context).subtitle2.override(
                                    fontFamily: 'Nunito',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: AuthUserStreamWidget(
                              child: Text(
                                currentUserDisplayName,
                                style:
                                    customTheme.of(context).subtitle2.override(
                                          fontFamily: 'Nunito',
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: customTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(50, 16, 50, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Цели',
                            style: customTheme.of(context).bodyText1.override(
                                  fontFamily: 'Nunito',
                                  fontSize: 18,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: StreamBuilder<List<GoalRecord>>(
                        stream: queryGoalRecord(
                          queryBuilder: (goalRecord) => goalRecord
                              .where('created_by',
                                  isEqualTo: currentUserReference)
                              .orderBy('created_at'),
                        ),
                        builder: (context, snapshot) {
                          // customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                                child: SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: SpinKitThreeBounce(
                                    color: customTheme.of(context).primaryColor,
                                    size: 25,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<GoalRecord> listViewGoalRecordList =
                              snapshot.data!;
                          if (listViewGoalRecordList.isEmpty) {
                            return Center(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: EmptyWidget(),
                              ),
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewGoalRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewGoalRecord =
                                  listViewGoalRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: customTheme
                                          .of(context)
                                          .primaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          color: customTheme.of(context).shadow,
                                          offset: Offset(0, 2),
                                          spreadRadius: 1,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: customTheme
                                            .of(context)
                                            .googleButton,
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 10, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    listViewGoalRecord
                                                        .goalInformation
                                                        .goalName,
                                                    'goalName',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: customTheme
                                                      .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 10, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    listViewGoalRecord
                                                        .goalInformation
                                                        .goalDescription,
                                                    'goalDesc',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: customTheme
                                                      .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Nunito',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 10,
                                          thickness: 1,
                                          indent: 16,
                                          endIndent: 16,
                                          color: Color(0x3F595959),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 5, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .calendarDay,
                                                          color: customTheme
                                                              .of(context)
                                                              .textFIcon,
                                                          size: 16,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'Старт:',
                                                            style: customTheme
                                                                .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  color: customTheme
                                                                      .of(context)
                                                                      .primaryText,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            'd/M/y',
                                                            listViewGoalRecord
                                                                .goalInformation
                                                                .dateStart,
                                                            locale:
                                                                customLocalizations
                                                                    .of(context)
                                                                    .languageCode,
                                                          ),
                                                          'd/M/y',
                                                        ),
                                                        style: customTheme
                                                            .of(context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito',
                                                              color: customTheme
                                                                  .of(context)
                                                                  .secondaryText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .calendarDay,
                                                          color: customTheme
                                                              .of(context)
                                                              .textFIcon,
                                                          size: 16,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'Конец:',
                                                            style: customTheme
                                                                .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito',
                                                                  color: customTheme
                                                                      .of(context)
                                                                      .primaryText,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            'd/M/y',
                                                            listViewGoalRecord
                                                                .goalInformation
                                                                .dateEnd,
                                                            locale:
                                                                customLocalizations
                                                                    .of(context)
                                                                    .languageCode,
                                                          ),
                                                          'd/M/y',
                                                        ),
                                                        style: customTheme
                                                            .of(context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito',
                                                              color: customTheme
                                                                  .of(context)
                                                                  .secondaryText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 10, 16, 10),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              LinearPercentIndicator(
                                                percent: valueOrDefault<double>(
                                                  functions.progressDays(
                                                      listViewGoalRecord
                                                          .goalInformation
                                                          .dateStart!,
                                                      listViewGoalRecord
                                                          .goalInformation
                                                          .dateEnd!),
                                                  1.0,
                                                ),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                lineHeight: 8,
                                                animation: true,
                                                progressColor: customTheme
                                                    .of(context)
                                                    .primaryColor,
                                                backgroundColor:
                                                    Color(0xFFF1F4F8),
                                                barRadius: Radius.circular(50),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
