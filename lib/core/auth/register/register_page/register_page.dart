import 'package:flutter/material.dart';
import 'package:m_hany_store/core/auth/register/register_widget/register_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

class RegisterPage extends UserInterface{
  const RegisterPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const RegisterWidget();
  }
  
}