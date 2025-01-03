import 'package:flutter/material.dart';

class OneButtonStyle extends ButtonStyle {
  OneButtonStyle._();

  static ButtonStyle get primary => ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
        foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
      );

  static ButtonStyle copyWithStyle(
    ButtonStyle baseStyle, {
    MaterialStateProperty<Color>? overlayColor,
    MaterialStateProperty<EdgeInsetsGeometry>? padding,
    MaterialStateProperty<Color>? backgroundColor,
    MaterialStateProperty<Color>? foregroundColor,
    MaterialStateProperty<double>? elevation,
    MaterialStateProperty<OutlinedBorder>? shape,
    MaterialStateProperty<BorderSide>? side,
  }) {
    return baseStyle.copyWith(
      overlayColor: overlayColor,
      padding: padding,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      shape: shape,
      side: side,
    );
  }
}
