import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

class ProfilePage extends UserInterface{
  const ProfilePage({super.key});



  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 15, 15),
              child: Text(
                'My Profile',
                style: getBoldStyle(color: ColorTheme.white),
              ),
            ),
            Container(// 01002581739
              width: double.infinity,
              // height: 60,
              decoration: BoxDecoration(
              color: ColorTheme.darkAppBar,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                      },
                      child: FormFeilds.rowTextIcon(
                        isIconImage: false,
                        text: 'Personal info', 
                        iconData: Icons.arrow_back_ios_new_rounded,
                        iconSize: 16,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        color: ColorTheme.primary,
                        thickness: 2.32,
                      ),
                    ),
                    FormFeilds.rowTextIcon(
                      isIconImage: false,
                      // firstIconData: Icons.favorite_border_rounded,
                      // firstIconImage: 'assets/icons/purse.png',
                      text:  'وسيلة الدفع',
                      iconData:  Icons.arrow_back_ios_new_rounded,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        color: ColorTheme.primary,
                        thickness: 2.32,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB( 0, 20, 15, 15),
              child: Text(
                'الإعدادات',
                style: getBoldStyle(color: ColorTheme.white, dDecoration: TextDecoration.none,),
              ),
            ),
            Container(
              decoration: BoxDecoration(
              color: ColorTheme.darkAppBar,
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.infinity,
              // height: 60,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Column(
                  children: [
                    Row(
                      children:  [
                        const Icon(
                          Icons.language_outlined,
                          color: ColorTheme.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'اللغة',
                          style: getBoldStyle(color: ColorTheme.white, dDecoration: TextDecoration.none,),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(33, 0, 0, 0),
                          child: Text(
                            'English',
                            style: getBoldStyle(color: ColorTheme.white, dDecoration: TextDecoration.none,),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        color: ColorTheme.primary,
                        thickness: 2.32,
                      ),
                    ),
                    FormFeilds.rowTextIcon(
                      isIconImage: false,
                      text: 'اتصل بنا',
                      iconData: Icons.arrow_back_ios_new_rounded,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        color: ColorTheme.primary,
                        thickness: 2.32,
                      ),
                    ),
                    InkWell(
                      child: FormFeilds.rowTextIcon(
                        isIconImage: false,
                        text: 'المزيد من تطبيقات اكسيم',
                        iconData: Icons.arrow_back_ios_new_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0 , 20, 22, 15),
              child: Text(
                'Log out',
                style: getBoldStyle(color: ColorTheme.white, dDecoration: TextDecoration.none,),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: (){},
              child: FormFeilds.buttonFormField(
                title: 'إنضم إلينا الأن',
                colorButton: ColorTheme.primary
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}