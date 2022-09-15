import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_hany_store/core/routes/route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';

class App extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser;
  final Routes routes;

  App({Key? key, required this.routes}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:   ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorTheme.darkBackroundPage,
          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
            statusBarColor:  Colors.transparent,
            statusBarBrightness: Brightness.light
          ),
        ),
      ),
      // ignore: unnecessary_null_comparison
      // initialRoute: user!.uid == null ? '/' : '/app_page_layout',
      onGenerateRoute: routes.generateRoute,
      
    );
  }
}
/* 
  FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
 */