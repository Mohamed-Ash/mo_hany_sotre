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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, categoriesPage);
              },
              child: Card(
                color: ColorTheme.porder,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
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
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, showOffersPage);
                // Navigator.pushReplacementNamed(context, showOffersPage);
              },
              child: Card(
                color: ColorTheme.porder,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormFeilds.containerImage(assetImage: 'assets/icons/un_select_offer.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'offers',
                        style: getBoldStyle(color: ColorTheme.wight,fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, adminPanelPage),
              // onTap: () => Navigator.pushReplacementNamed(context, adminPanelPage),
              child: Card(
                color: ColorTheme.porder,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
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
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, topicPage),
              // onTap: () => Navigator.pushReplacementNamed(context, topicPage),
              child: Card(
                color: ColorTheme.porder,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormFeilds.containerImage(assetImage: 'assets/icons/messages.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Topics',
                        style: getBoldStyle(color: ColorTheme.wight,fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, reminderPage),
              // onTap: () => Navigator.pushReplacementNamed(context, reminderPage),
              child: Card(
                color: ColorTheme.porder,
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormFeilds.containerImage(assetImage: 'assets/icons/reminder.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'notifications',
                        style: getBoldStyle(color: ColorTheme.wight,fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}