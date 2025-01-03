import 'dart:ui';

class LocalizationConstraints {
  LocalizationConstraints._();

  static const viLocale = Locale('vi', 'VN');
  static const enLocale = Locale('en', 'US');

  static const supportedLocales = [
    viLocale,
    enLocale,
  ];

  static const translationPath = 'lib/translations';
}
