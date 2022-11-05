import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class AdminPanelWidget extends StatefulWidget {  
  const AdminPanelWidget({Key? key}) : super(key: key);

  @override
  State<AdminPanelWidget> createState() => _AdminPanelWidgetState();
}

class _AdminPanelWidgetState extends State<AdminPanelWidget> {
  
  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, showAdminsPage),
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
                        width: 20,
                      ),
                      Text(
                        'Admins',
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
              onTap: () => Navigator.pushReplacementNamed(context, showUsersPage),
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
                      FormFeilds.containerImage(assetImage: 'assets/icons/un_select_profile.png',height: 40,width: 40),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Users',
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