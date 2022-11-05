import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/show_admins/show_admins_widget/show_admins_widget.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/admin_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class ShowAdminsPage extends AdminInterface{
  late ApiDataBloc<AdminModel> adminModel;
  
  ShowAdminsPage({super.key}){
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
      'All Admins',
      style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
    ),
  );

  @override
  Widget buildBody(BuildContext context) {
    return ShowAdminsWidget(adminModel: adminModel,);
  }

}