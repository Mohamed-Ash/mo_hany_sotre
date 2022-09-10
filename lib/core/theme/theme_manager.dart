import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';

ThemeData getAppThemeData(){
  return ThemeData(
    primaryColor: ColorTheme.darkBackroundPage,
    brightness: Brightness.dark,
    // scaffoldBackgroundColor:  ColorTheme.backgroundColorPage,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorTheme.darkBackroundPage,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:  ColorTheme.darkBackroundPage,
      ),
    ),
  );
}