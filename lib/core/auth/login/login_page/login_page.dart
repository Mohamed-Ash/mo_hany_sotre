import 'package:flutter/material.dart';
import 'package:m_hany_store/core/auth/login/login_widget/login_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class LoginPage extends UserInterface{
  const LoginPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const LoginWidget();
  }
  
}

  