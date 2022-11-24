import 'package:flutter/material.dart';

extension CustomeColor on ThemeData {
  Color get textBlack => const Color(0xFF150C00);
  Color get orange => const Color(0xFFFF8933);
  Color get whiteBackground => const Color(0xFFF5F5F5);
  Color get white => const Color(0xFFFFFFFF);
  Color get purple => const Color(0xFF6C72E9);
}

extension CustomeTextStyle on ThemeData {
  static const String fontFamily = 'fedra';
  TextStyle get primaryHeading => TextStyle(
        fontSize: 28,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        color: textBlack,
      );
  TextStyle get smallStandardBody => TextStyle(
        fontSize: 14,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w100,
        color: textBlack,
      );
  TextStyle get smallEmphasisBody => TextStyle(
        fontSize: 14,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        color: textBlack,
      );
  TextStyle get extralSmallBody => TextStyle(
        fontSize: 10,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        color: textBlack,
      );
  TextStyle get emphasisBody => TextStyle(
        fontSize: 16,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        color: textBlack,
      );
  TextStyle get tertiaryHeading => TextStyle(
        fontSize: 18,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        color: textBlack,
      );
}
