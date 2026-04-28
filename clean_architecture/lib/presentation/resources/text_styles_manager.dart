import 'package:clean_architecture/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    double fontSize, Color color, FontWeight fontWeight, String fontFamily) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: fontFamily);
}

// regular font style

TextStyle getRegularFontStyle( // i initialized the font size to 12, u can initialize it to anything else, or just pass it as required without initializing
    {double fontSize = FontSizeManager.s12, required Color color}) {
  // since this method should return the regular font style, there is no need to pass the font weight nor the font family, cuz they should be like this on the regular font style
  return _getTextStyle(
      fontSize, color, FontWeightManager.regular, FontConstants.fontFamily);
}

// light font style
TextStyle getLightFontStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(
      fontSize, color, FontWeightManager.light, FontConstants.fontFamily);
}


// medium font style
TextStyle getMediumFontStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(
      fontSize, color, FontWeightManager.medium, FontConstants.fontFamily);
}

// bold font style
TextStyle getBoldFontStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(
      fontSize, color, FontWeightManager.bold, FontConstants.fontFamily);
}

// semiBold font style
TextStyle getSemiBoldFontStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(
      fontSize, color, FontWeightManager.semiBold, FontConstants.fontFamily);
}
