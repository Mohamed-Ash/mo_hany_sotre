import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';

ThemeData getAppThemeData(){
  return ThemeData(
    // scaffoldBackgroundColor:  ColorTheme.backgroundColorPage,
    canvasColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorTheme.darkBackroundPage,
      systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
        statusBarColor:  Colors.transparent,
        statusBarBrightness: Brightness.light
      ),
    ),
  );
}