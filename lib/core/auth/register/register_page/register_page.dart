import 'package:flutter/material.dart';
import 'package:m_hany_store/core/auth/register/register_widget/register_widget.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/user_model.dart';
import 'package:m_hany_store/user/user_interface.dart';

class RegisterPage extends UserInterface{
  late final ApiDataBloc<UserModel> userBloc;

  RegisterPage({super.key}){
    userBloc = ApiDataBloc<UserModel>();
  }

  @override
  Widget buildBody(BuildContext context) {
    return RegisterWidget(userBloc: userBloc,);
  }
  
}