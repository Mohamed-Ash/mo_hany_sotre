import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class AdminHome extends AdminInterface{
  const AdminHome({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pushNamed(context, appPageLayout),
      icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    ),
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
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, categoriesPage);
            },
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: const Border(
                  bottom: BorderSide(
                    color: ColorTheme.porder,
                    width: 1,
                  ),
                  left: BorderSide(
                    color: ColorTheme.porder,
                    width: 1,
                  ),
                  right: BorderSide(
                    color: ColorTheme.porder,
                    width: 1,
                  ),
                  top: BorderSide(
                    color: ColorTheme.porder,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FormFeilds.containerImage(assetImage: 'assets/icons/category.png'),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Categories',
                    style: getBoldStyle(color: ColorTheme.wight,fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: const Border(
                bottom: BorderSide(
                  color: ColorTheme.porder,
                  width: 1,
                ),
                left: BorderSide(
                  color: ColorTheme.porder,
                  width: 1,
                ),
                right: BorderSide(
                  color: ColorTheme.porder,
                  width: 1,
                ),
                top: BorderSide(
                  color: ColorTheme.porder,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormFeilds.containerImage(assetImage: 'assets/icons/manager.png'),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Admin Panel',
                  style: getBoldStyle(color: ColorTheme.wight,fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}