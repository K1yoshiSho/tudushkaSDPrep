// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class customTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static customTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color outlinedButton;
  late Color googleButton;
  late Color textFIcon;
  late Color shadow;
  late Color navbar;
  late Color navbarUnselected;
  late Color btnText;
  late Color lineColor;
  late Color customColor3;
  late Color customColor4;
  late Color white;
  late Color background;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends customTheme {
  late Color primaryColor = const Color(0xFF00C0FF);
  late Color secondaryColor = const Color(0xFF88CAFF);
  late Color tertiaryColor = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFFF5963);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFF1F4F8);
  late Color primaryText = const Color(0xFF101213);
  late Color secondaryText = const Color(0xFF57636C);

  late Color outlinedButton = Color(0xFFFFFFFF);
  late Color googleButton = Color(0xFFF1F4F8);
  late Color textFIcon = Color(0xFF8C8C8C);
  late Color shadow = Color(0x11000000);
  late Color navbar = Color(0xFF00C0FF);
  late Color navbarUnselected = Color(0xFF888888);
  late Color btnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFDBE2E7);
  late Color customColor3 = Color(0xFFDF3F3F);
  late Color customColor4 = Color(0xFF090F13);
  late Color white = Color(0xFFFFFFFF);
  late Color background = Color(0xFF1D2429);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final customTheme theme;

  String get title1Family => 'Nunito';
  TextStyle get title1 => TextStyle(
        fontFamily: 'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  String get title2Family => 'Nunito';
  TextStyle get title2 => TextStyle(
        fontFamily: 'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      );
  String get title3Family => 'Nunito';
  TextStyle get title3 => TextStyle(
        fontFamily: 'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  String get subtitle1Family => 'Nunito';
  TextStyle get subtitle1 => TextStyle(
        fontFamily: 'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );
  String get subtitle2Family => 'Nunito';
  TextStyle get subtitle2 => TextStyle(
        fontFamily: 'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  String get bodyText1Family => 'Nunito';
  TextStyle get bodyText1 => TextStyle(
        fontFamily: 'Nunito',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
  String get bodyText2Family => 'Nunito';
  TextStyle get bodyText2 => TextStyle(
        fontFamily: 'Nunito',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
}

class DarkModeTheme extends customTheme {
  late Color primaryColor = const Color(0xFF00C0FF);
  late Color secondaryColor = const Color(0xFF88CAFF);
  late Color tertiaryColor = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFFF5963);
  late Color primaryBackground = const Color(0xFF1A1F24);
  late Color secondaryBackground = const Color(0xFF101213);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF95A1AC);

  late Color outlinedButton = Color(0xFF02A55C);
  late Color googleButton = Color(0xFFFFFFFF);
  late Color textFIcon = Color(0xFFFFFFFF);
  late Color shadow = Color(0x11000000);
  late Color navbar = Color(0xFF00C0FF);
  late Color navbarUnselected = Color(0xFF888888);
  late Color btnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFF323B45);
  late Color customColor3 = Color(0xFFDF3F3F);
  late Color customColor4 = Color(0xFF090F13);
  late Color white = Color(0xFFFFFFFF);
  late Color background = Color(0xFF1D2429);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
