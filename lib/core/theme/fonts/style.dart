import 'package:flutter/material.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';

class Matgin{
  static const double m8 = 8.0;
  static const double m10 = 10.0;
  static const double m12 = 12.0;
  static const double m14 = 14.0;
  static const double m16 = 16.0;
  static const double m18 = 18.0;
  static const double m20 = 20.0;
  static const double m22 = 22.0;
}

class Size{
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22  = 22.0;
}

TextStyle _getTextStyle(
  double fontSize,
  Color color,
  FontWeight fontWeight,
  TextDecoration dDecoration,
  ){
  return TextStyle(
    fontFamily: FontsTheme.fontFamily,
    fontWeight: fontWeight,
    color: color,
    fontSize: fontSize,
    decoration: dDecoration
  );
}

TextStyle getLightStyle({
  required Color color,
  double fontSize = FontSize.s12,
  TextDecoration dDecoration = TextDecoration.none,
}){
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.light,
    TextDecoration.none
  );
}

TextStyle getRegulerStyle({
  required Color color,
  double fontSize = FontSize.s12, 
  TextDecoration dDecoration = TextDecoration.none,
}){
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.reguler,
    TextDecoration.none,
  );
}

TextStyle getMediumStyle({
  required Color color,
  double fontSize = FontSize.s12,
  TextDecoration dDecoration = TextDecoration.none,
}){
  return _getTextStyle(
    fontSize,
     color,
    FontWeightManager.medium,
    TextDecoration.none,
  );
}

TextStyle getSemiBoldStyle({
  required Color color,
  double fontSize =FontSize.s14,
  TextDecoration dDecoration = TextDecoration.none,
}){
  return _getTextStyle(
    fontSize, 
    color, 
    FontWeightManager.semiBold,
    TextDecoration.none,
  );
}

TextStyle getBoldStyle({
  required Color color,
  double fontSize = FontSize.s12,
  TextDecoration dDecoration = TextDecoration.none,
}){
  return _getTextStyle(
    fontSize, 
    color, 
    FontWeightManager.bold,
    TextDecoration.none,
  );
}


TextStyle getHintTextStyle({
  required Color color,
  double fontSizes = FontSize.s12, 
  TextDecoration dDecoration = TextDecoration.none,
}){
  return _getTextStyle(
    fontSizes,
    color,
    FontWeightManager.semiBold,
    TextDecoration.none,
  );
}

TextStyle geTitleTextStyle({
  required Color color,
  double fontSizes = FontSize.s16,
  TextDecoration dDecoration = TextDecoration.none,
}){
  return _getTextStyle(
    fontSizes,
    color,
    FontWeightManager.bold,
    TextDecoration.none,
  );
}