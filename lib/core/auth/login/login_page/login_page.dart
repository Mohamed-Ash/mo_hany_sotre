import 'package:flutter/material.dart';
import 'package:m_hany_store/core/auth/login/login_widget/login_widget.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/user_model.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class LoginPage extends UserInterface{
 late final ApiDataBloc<UserModel> userBloc;

  LoginPage({super.key}){
    userBloc = ApiDataBloc<UserModel>();
  }


  @override
  Widget buildBody(BuildContext context) {
    return LoginWidget(userBloc: userBloc,);
  }
  
}

  