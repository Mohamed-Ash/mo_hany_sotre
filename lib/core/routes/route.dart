import 'package:flutter/material.dart';
import 'package:m_hany_store/core/auth/login/login_page.dart';
import 'package:m_hany_store/core/auth/register/register_page/register_page.dart';
import 'package:m_hany_store/core/page/app_page_layout.dart';
import 'package:m_hany_store/core/routes/string_route.dart';

class Routes{

  Route? generateRoute(RouteSettings settings){
    switch (settings.name) {
      case appPageLayout:                                       return MaterialPageRoute(builder: (_)=> const AppPageLayout());
      case registerPage:                                        return MaterialPageRoute(builder: (_)=>  RegisterPage());
      case loginPage:                                           return MaterialPageRoute(builder: (_)=>  LoginPage());
        
      default:
    }
    return null; 
  }
}