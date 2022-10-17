import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_hany_store/core/routes/route.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/theme_manager.dart';

class App extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser;
  final Routes routes;

  App({Key? key, required this.routes}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null ? loginPage : appPageLayout,
      theme: getAppThemeData(),
      onGenerateRoute: routes.generateRoute,
    );
  }
}