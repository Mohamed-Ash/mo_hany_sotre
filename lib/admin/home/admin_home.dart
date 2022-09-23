import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_drawer/admin_drawer.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class AdminHome extends AdminInterface{
  const AdminHome({super.key});
  @override
  PreferredSizeWidget? get appBar => AppBar(
    title: Text(
      'Dashbord',
      style: getBoldStyle(color: ColorTheme.white,fontSize: 22),
    ),
  );
  @override
  Widget? get buildDrawer =>  const AdminDrawer();

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: const [
         
      ],
    );
  }
}