import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_hany_store/core/routes/route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';

class App extends StatelessWidget{
  final Routes routes;

  const App({Key? key, required this.routes}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:   ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorTheme.darkBackroundPage,
          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
            statusBarColor:  Colors.red,
            statusBarBrightness: Brightness.light
          ),
        ),
      ),
      onGenerateRoute: routes.generateRoute,
      
    );
  }
}