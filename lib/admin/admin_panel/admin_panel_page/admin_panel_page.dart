import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/admin_panel/admin_panel_widget/admin_panel_widget.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class AdminPanelPage extends AdminInterface{
  const AdminPanelPage({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    ),
    centerTitle: true,
    title: Text(
      'Admin Panel',
      style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
    ),
  );
  
  @override
  Widget buildBody(BuildContext context) {
    return const AdminPanelWidget();
  }
}