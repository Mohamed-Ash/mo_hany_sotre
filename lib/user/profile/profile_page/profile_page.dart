import 'package:flutter/material.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/admin_model.dart';
import 'package:m_hany_store/user/profile/profile_widget/profile_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class ProfilePage extends UserInterface{
  late ApiDataBloc<AdminModel> adminBloc;

  ProfilePage({super.key}){
    adminBloc = ApiDataBloc<AdminModel>()..add(const IndexDataEvent());
  }

  @override
  Widget buildBody(BuildContext context) {
    return ProfileWidget(adminBloc: adminBloc,);
  }
}