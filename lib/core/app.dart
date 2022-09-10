import 'package:flutter/material.dart';
import 'package:m_hany_store/core/routes/route.dart';
import 'package:m_hany_store/core/theme/theme_manager.dart';

class App extends StatelessWidget{
  final Routes routes;

  const App({Key? key, required this.routes}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  getAppThemeData(),
      onGenerateRoute: routes.generateRoute,
      
    );
  }
}