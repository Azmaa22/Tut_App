import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utilities/constants/font_manager.dart';

class TextStyleManager {
  static TextStyle _getTextStyle(
      double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: color,
        fontWeight: fontWeight);
  }

// regular style

  static TextStyle getRegularStyle(
      {double fontSize = FontSizeManager.s12, required Color color}) {
    return _getTextStyle(fontSize, FontFamilyManager.fontFamily,
        FontWeightManager.regular, color);
  }
// light text style

  static TextStyle getLightStyle(
      {double fontSize = FontSizeManager.s12, required Color color}) {
    return _getTextStyle(
        fontSize, FontFamilyManager.fontFamily, FontWeightManager.light, color);
  }
// bold text style

  static TextStyle getBoldStyle(
      {double fontSize = FontSizeManager.s12, required Color color}) {
    return _getTextStyle(
        fontSize, FontFamilyManager.fontFamily, FontWeightManager.bold, color);
  }

// semi bold text style

  static TextStyle getSemiBoldStyle(
      {double fontSize = FontSizeManager.s12, required Color color}) {
    return _getTextStyle(fontSize, FontFamilyManager.fontFamily,
        FontWeightManager.semiBold, color);
  }

// medium text style

  static TextStyle getMediumStyle(
      {double fontSize = FontSizeManager.s12, required Color color}) {
    return _getTextStyle(fontSize, FontFamilyManager.fontFamily,
        FontWeightManager.medium, color);
  }
}
