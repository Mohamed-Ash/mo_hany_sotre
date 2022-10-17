import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

class CheckEmailPage extends UserInterface{
  const CheckEmailPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12,45,12,22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FormFeilds.containerImage(assetImage: 'assets/images/new_message.png',height: 333,width: 333),
           const SizedBox(
            height: 22,
          ),
          Text(
            'Check Your mail',
            style: getBoldStyle(
              color: ColorTheme.wight,
              dDecoration: TextDecoration.none,
              fontSize: 34, 
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          Wrap(
            spacing: 12,
            children:[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'We have sent a password recovery Instructions to your email.',
                  style: getBoldStyle(
                    color: ColorTheme.hintText,
                    fontSize: 22
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 33,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, loginPage, (route) => false);
            },
            child: FormFeilds.buttonFormField(
              title: 'Go to Sign in',
              colorButton: ColorTheme.primary,
              heightButton: 50,
            ),
          ),
          // const SizedBox(height: 255),
        /*   Text(
            'Did not receive the email ? check your spam filter, or',
            style: getSemiBoldStyle(
              color: ColorTheme.hintText,
              fontSize: 14
            ),
          ),
          const SizedBox(height: 5,),
          TextButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, loginPage, (route) => false), 
            child: Text(
              'try another email other',
              style:getSemiBoldStyle(
                color: ColorTheme.primary,
                fontSize: 14
              ),
            ),
          ), */
        ],
      ),
    );
  }
}