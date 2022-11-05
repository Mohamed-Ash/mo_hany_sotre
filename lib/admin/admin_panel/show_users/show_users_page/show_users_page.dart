import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/admin_model.dart';
import 'package:m_hany_store/core/model/user_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

import '../show_users_widget/show_users_widget.dart';

// ignore: must_be_immutable
class ShowUsers extends AdminInterface{
  late ApiDataBloc<UserModel> userModel;
  late ApiDataBloc<AdminModel> adminModel;

  ShowUsers({super.key}){
    userModel = ApiDataBloc<UserModel>()..add(const IndexDataEvent());
    adminModel = ApiDataBloc<AdminModel>()..add(const IndexDataEvent());
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    ),
    centerTitle: true,
    title: Text(
      'All Users',
      style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
    ),
  );

  @override
  Widget buildBody(BuildContext context) {
    return ShowUsersWidget(userModel: userModel,adminModel: adminModel,);
  }
}