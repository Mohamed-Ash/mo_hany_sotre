// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

class ResetEmailPage extends UserInterface{
  final  updateemailController = TextEditingController();
  final formKye = GlobalKey<FormState>();

  ResetEmailPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22,45,22,0),
      child: Form(
        key: formKye,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  }, 
                  icon: const Icon(Icons.arrow_back,color: ColorTheme.wight,size: 22),
                ),
                  Text(
                  'Back',
                  style: getSemiBoldStyle(
                    color: ColorTheme.wight,
                    fontSize: 14
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 44,
                ),
                Text(
                  'Change Email ',
                  style: getBoldStyle(
                    color: ColorTheme.wight,
                    dDecoration: TextDecoration.none,
                    fontSize: 34, 
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                Text(
                  'Enter the email associated with your account and we\'ll'
                  'send an email with instructions to change your email.',
                  style: getSemiBoldStyle(
                    color: ColorTheme.hintText,
                    fontSize: 14
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                Text(
                  'E-mail',
                  style: getSemiBoldStyle(
                    color: ColorTheme.wight,
                    fontSize: 14
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:  ColorTheme.backroundInput,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    FormFeilds.textFormField(
                      controller: updateemailController, 
                      keyboardType: TextInputType.emailAddress, 
                      hintText: 'hello@company.com',
                      validator: (validate){
                        if(validate!.isEmpty){
                          return 'Please Enter your Email';
                        }else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(validate)){
                          return 'Please a valid Email';
                        }else if (validate.endsWith("@google.com")){
                          return "Email address is not valid!";
                        }else{
                          return null; 
                        }
                      }
                    ),
                  ],
                ),
                const SizedBox(
                  height: 55,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(33, 0, 33, 0),
                  child: InkWell(
                    onTap:  ()async{
                      if(formKye.currentState!.validate()) verify(context);
                    },
                    child: FormFeilds.buttonFormField(
                      dPadding: false,
                      title: 'Send Instructions',
                      colorButton: ColorTheme.primary,
                      heightButton: 50,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> verify(BuildContext context) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      FormFeilds.showLoading(context);
      await user!.updateEmail(updateemailController.text).then(
        (_) {
          FormFeilds.showMyDialog(
            context: context,
            message: 'Email has been changed successfully',
            image: 'assets/icons/icon_success.png',
            heightImage: 55,
            widthImage: 55,
            actions:  <Widget>[
              Padding(
                padding: const  EdgeInsets.fromLTRB(60, 0, 60, 0),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, loginPage, (route) => false);
                  },
                  child: FormFeilds.buttonFormField(
                    title:  'Back to sign in',
                    dPadding: false,
                    colorButton: ColorTheme.primary,
                    colorText: ColorTheme.wight,
                    fontSize: 14
                  ),
                ),
              ),
            ]
          );
        });
    } catch (e) {
      print(e.toString());
    }
  }
}