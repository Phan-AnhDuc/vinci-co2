import 'package:basegetxbloc/constant/one_colors.dart';
import 'package:basegetxbloc/constant/one_theme.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme();

  ThemeData? appTheme;

  factory CustomTheme.fromContext(BuildContext context) {
    final CustomTheme theme = CustomTheme();

    theme.appTheme = ThemeData(
      primaryColor: OneColors.brandVNP,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'OLInter',
      textTheme: TextTheme(
        bodyText2: OneTheme.of(context).body2,
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        height: 56.0,
        buttonColor: OneColors.brandVNP,
      ),
    );

    return theme;
  }
}
