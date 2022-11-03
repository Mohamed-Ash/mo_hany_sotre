import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/reminder/reminder_widget/reminder_widget.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/user_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class ReminderPage extends AdminInterface{
  late ApiDataBloc<UserModel> userBloc;
  
  ReminderPage({super.key}){
    userBloc = ApiDataBloc()..add(const IndexDataEvent());
  }

   @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    ),
    title: Text(
      'add notification',
      style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
    ),
  );
  
  @override
  Widget buildBody(BuildContext context) {
    return ReminderWidget(userBloc: userBloc,);
  }
}