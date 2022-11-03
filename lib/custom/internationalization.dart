import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class customLocalizations {
  customLocalizations(this.locale);

  final Locale locale;

  static customLocalizations of(BuildContext context) =>
      Localizations.of<customLocalizations>(context, customLocalizations)!;

  static List<String> languages() => ['ru'];

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
  }) =>
      [ruText][languageIndex] ?? '';
}

class customLocalizationsDelegate
    extends LocalizationsDelegate<customLocalizations> {
  const customLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      customLocalizations.languages().contains(locale.toString());

  @override
  Future<customLocalizations> load(Locale locale) =>
      SynchronousFuture<customLocalizations>(customLocalizations(locale));

  @override
  bool shouldReload(customLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap =
    <Map<String, Map<String, String>>>[].reduce((a, b) => a..addAll(b));
