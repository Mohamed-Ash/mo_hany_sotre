import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';

ThemeData getAppThemeData(){
  return ThemeData(
    // scaffoldBackgroundColor:  ColorTheme.backgroundColorPage,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorTheme.darkBackroundPage,
      systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
        statusBarColor:  Colors.red,
        statusBarBrightness: Brightness.light
      ),
    ),
  );
}