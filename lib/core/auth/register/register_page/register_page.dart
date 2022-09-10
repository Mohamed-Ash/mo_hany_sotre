import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

class RegisterPage extends UserInterface{
  final  nameController = TextEditingController();
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  final  comfirmPasswordController = TextEditingController();
  final  jobsController = TextEditingController();
  final  phoneController = TextEditingController();

  RegisterPage({super.key});
  
   
  
  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'welcome to',
                  style: getBoldStyle(
                    color: ColorTheme.primary,
                    dDecoration: TextDecoration.none,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'M.Hany store',
                    style: getBoldStyle(
                      color: ColorTheme.primary,
                      fontSize: 20, 
                      dDecoration: TextDecoration.none
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              'First Name',
              style: getSemiBoldStyle(
                color: ColorTheme.primary,
                fontSize: 14
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color:  ColorTheme.backroundInput,
                borderRadius: BorderRadius.circular(8),
              ),
              child: FormFeilds.textField(
                keyboardType: TextInputType.name, 
                controller: nameController, 
                hintText: 'First Name', 
                validator: (vail){
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
             'Email',
              style: getSemiBoldStyle(
                color: ColorTheme.primary,
                fontSize: 14
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color:  ColorTheme.backroundInput ,
                borderRadius: BorderRadius.circular(8),
              ),
              child: FormFeilds.textField(
                controller: phoneController, 
                keyboardType: TextInputType.phone, 
                hintText:  'Email',
              ),
            ),
             const SizedBox(
              height: 18,
            ),
            Text(
              'Password',
              style: getSemiBoldStyle(
                color: ColorTheme.primary,
                fontSize: 14
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color:  ColorTheme.backroundInput,
                borderRadius: BorderRadius.circular(8),
              ),
              child: FormFeilds.textField(
                controller: passwordController, 
                keyboardType: TextInputType.phone, 
                hintText: 'Password',
              ),
            ),
              const SizedBox(
              height: 18,
            ),
            Text(
             'Confirm Password',
              style: getSemiBoldStyle(
                color: ColorTheme.primary,
                fontSize: 14
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color:  ColorTheme.backroundInput,
                borderRadius: BorderRadius.circular(8),
              ),
              child: FormFeilds.textField(
                controller: comfirmPasswordController, 
                keyboardType: TextInputType.phone, 
                hintText: 'Confirm Password',
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
              child: InkWell(
                onTap: ()async{
                  Navigator.pushNamed(context, appPageLayout);
                },
                child: FormFeilds.buttonFormField(
                  title: 'Create New Accounte',
                  colorButton: ColorTheme.primary,
                  colorText: ColorTheme.white,
                  heightButton: 50,
                  dPadding: false,
                ),
              ),
            ),
             const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  'Already have an account ?',
                  style: getSemiBoldStyle(color: ColorTheme.authHint,fontSize: 12),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(//'تسجيل الدخول',
                  onTap: (){
                    Navigator.pushNamed(context, loginPage);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorTheme.primary,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style:TextStyle(
                        fontFamily: FontsTheme.fontFamily,
                        color: ColorTheme.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
              ],
            ),
           const SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Container(
                  width: 125,
                  height: 2,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ColorTheme.primary,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                Text(
                  '  Or  ',
                  style: getSemiBoldStyle(color: ColorTheme.authHint),
                ),
                Container(
                  width: 125,
                  height: 2,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ColorTheme.primary,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 18,),
            FormFeilds.continueWith(
              title: 'Continue with facebook',
              assetImage: 'assets/images/facebook.png',
            ),
            // const SizedBox(height: 22,),
            FormFeilds.continueWith(
              title: 'Continue with google',
              assetImage: 'assets/images/google.png',
            ),
          ],
        ),
      ),
    );
  }
}