// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class LoginPage extends UserInterface{
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  GlobalKey formKye = GlobalKey<FormState>();


  LoginPage({Key? key}) : super(key: key);

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12,45,12,0),
        child: Form(
          key: formKye,
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
                  keyboardType: TextInputType.visiblePassword, 
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
                    style: getSemiBoldStyle(color: ColorTheme.hintText,fontSize: fixFontSize(context)),
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
                      child: Text(
                        'Reset a new password',
                        style:TextStyle(
                          fontFamily: FontsTheme.fontFamily,
                          color: ColorTheme.primary,
                          fontSize: fixFontSize(context),
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
                    buildLoginUser(context);
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
                    style: getSemiBoldStyle(color: ColorTheme.hintText,fontSize: 12),
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
                    width: fixBixiles(context),
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
                    style: getSemiBoldStyle(color: ColorTheme.hintText),
                  ),
                  Container(
                    width: fixBixiles(context),
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
      ),
    );
  }
  fixBixiles(BuildContext context){
    if(MediaQuery.of(context).size.width > 50.0 && MediaQuery.of(context).size.width < 100.0 ) {
      return 90.0;
    }else if (MediaQuery.of(context).size.width > 100.0 && MediaQuery.of(context).size.width < 150.0 ){
      return 125.0;
    }else if (MediaQuery.of(context).size.width > 150.0 && MediaQuery.of(context).size.width < 200.0 ){
      return 140.0;
    }else{
      return 160.0;
    }
  }

  fixFontSize(BuildContext context){
    if(MediaQuery.of(context).size.width > 50.0 && MediaQuery.of(context).size.width < 100.0 ) {
      return 11.0;
    }else if (MediaQuery.of(context).size.width > 100.0 && MediaQuery.of(context).size.width < 200.0 ){
      return 12.5;
    }else{ 
      return 12.5;
    }
  }

  buildLoginUser(context)async{
    try {
      showLoading(context);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if(credential.user!.emailVerified){
        Navigator.pushNamed(context, appPageLayout);
        showMyDialog(context, 'please confirem your email');
      }else{
        Navigator.pop(context);
      }
      print(credential.user!.emailVerified);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMyDialog(context, 'No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showMyDialog(context, 'Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }
  }

  showMyDialog(context,String message){
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(message),
              ],
            ),
          ),
        );
      },
    );
  }

  showLoading(context){
    return showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.transparent,
          // title: Text('please waite'),
          content:  SizedBox(
            height: 50,
            child:  Center(
              child:  CircularProgressIndicator(
                color: ColorTheme.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}