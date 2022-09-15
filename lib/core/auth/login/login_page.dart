
// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

class LoginPage extends UserInterface{
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser;


  LoginPage({Key? key}) : super(key: key);

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12,45,12,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: getBoldStyle(
                color: ColorTheme.primary,
                dDecoration: TextDecoration.none,
                fontSize: 34,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'E-mail',
              style: getSemiBoldStyle(
                color: ColorTheme.primary,
                fontSize: 14
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color:  ColorTheme.backroundInput,
                borderRadius: BorderRadius.circular(8),
              ),
              child: FormFeilds.textField(
                controller: emailController, 
                keyboardType: TextInputType.emailAddress, 
                hintText: 'hello@company.com',
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              'Password',
              style: getSemiBoldStyle(
                color: ColorTheme.primary,
                fontSize: 14
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color:  ColorTheme.backroundInput ,
                borderRadius: BorderRadius.circular(8),
              ),
              child:  FormFeilds.textField(
                controller: passwordController, 
                keyboardType: TextInputType.emailAddress, 
                hintText: 'your password',
              ),
            ),
            const SizedBox(
              height: 33,   
            ),
             Row(
              children: [
                Text(
                  'Did you forget your password ?',
                  style: getSemiBoldStyle(color: ColorTheme.authHint,fontSize: 12),
                ),
                const SizedBox(
                  width: 11,
                ),
                InkWell(
                  onTap: (){},
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
                      'Reset a new password',
                      style:TextStyle(
                        fontFamily: FontsTheme.fontFamily,
                        color: ColorTheme.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: InkWell(
                onTap: ()async{
                  buildLoginUser();
                },
                child: FormFeilds.buttonFormField(
                  title:'sign in',
                  colorButton: ColorTheme.primary,
                  colorText: ColorTheme.white,
                  heightButton: 50,
                  dPadding: false,
                ),
              ),
            ),
            const SizedBox(height: 22,),
            Row(
              children: [
                Text(
                 'Do not have an account ?',
                  style: getSemiBoldStyle(color: ColorTheme.authHint,fontSize: 12),
                ),
                const SizedBox(
                  width: 11,
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, registerPage);
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
                      'Create an account',
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
            const SizedBox(height: 22,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Container(
                  width: 140,
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
                  width: 140,
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
            const SizedBox(height: 12,),
            FormFeilds.continueWith(
              title: 'Continue with facebook',
              assetImage: 'assets/images/facebook.png',
            ),
            const SizedBox(height: 12,),
            FormFeilds.continueWith(
              title: 'Continue with google',
              assetImage: 'assets/images/google.png',
            ),
          ],
        ),
      ),
    );
  }
   buildLoginUser()async{
    try {
      UserCredential serCredential  = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,

      );
      print(serCredential.user!.emailVerified);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}