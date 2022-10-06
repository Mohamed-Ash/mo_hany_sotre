import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class AdminHome extends AdminInterface{
  const AdminHome({super.key});
  @override
  PreferredSizeWidget? get appBar => AppBar(
    
    title: Text(
      'Dashbord',
      style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
    ),
  );
  //@override
  // Widget? get buildDrawer =>  const AdminDrawer();

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: const Border(
                bottom: BorderSide(color: ColorTheme.porder,width: 1),
                left: BorderSide(color: ColorTheme.porder,width: 1),
                right: BorderSide(color: ColorTheme.porder,width: 1),
                top: BorderSide(color: ColorTheme.porder,width: 1),
              ),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const  DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/images/upgrade_gtav.jpg")
                    ),
                  ),
                ),
                const SizedBox(
                  width: 55,
                ),
                Center(
                  child: Text(
                    'Upgrade Gta v',
                    style: getBoldStyle(color: ColorTheme.wight,fontSize: 13  ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}