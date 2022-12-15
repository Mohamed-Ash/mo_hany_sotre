// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/user_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class LoginWidget extends StatefulWidget {
  final ApiDataBloc<UserModel> userBloc;
  const LoginWidget({Key? key,required this.userBloc}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  
  final formKye = GlobalKey<FormState>();

  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12,45,12,0),
        child: Form(
          key: formKye,
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: getBoldStyle(
                    color: ColorTheme.wight,
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
                      controller: emailController, 
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
                  height: 28,
                ),
                Text(
                  'Password',
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
                        color:  ColorTheme.backroundInput ,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    FormFeilds.textFormField(
                      controller: passwordController, 
                      keyboardType: TextInputType.visiblePassword, 
                      hintText: 'your password',
                      obscureText: showPassword,
                      validator: (value){
                        if(value == null){
                          return 'Enter the password';
                        }else if(value.length < 6){
                          return 'Password must has 8 characters' ;
                        }
                        return null;
                      },
                      suffixIcon: IconButton(
                        splashColor: Colors.transparent,
                        
                        onPressed: (){
                          setState(() {
                            showPassword = !showPassword ; 
                          });  
                        }, 
                        icon: showPassword  == true
                          ? FormFeilds.containerImage(assetImage: 'assets/icons/eye.png') 
                          : FormFeilds.containerImage(assetImage: 'assets/icons/closed_eye.png') 
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,   
                ),
                 Row(
                  children: [
                    Text(
                      'Did you forget your password ?',
                      style: getSemiBoldStyle(color: ColorTheme.hintText,fontSize: 11.0),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, resetPasswordPage);
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
                          'Reset a new password',
                          style:TextStyle(
                            fontFamily: FontsTheme.fontFamily,
                            color: ColorTheme.primary,
                            fontSize: 11.0,
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
                      if(formKye.currentState!.validate()){
                        buildLoginUser(context);
                      }
                    },
                    child: FormFeilds.buttonFormField(
                      title:'sign in',
                      colorButton: ColorTheme.primary,
                      colorText: ColorTheme.wight,
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
                      style: getSemiBoldStyle(color: ColorTheme.hintText,fontSize: 11.0,),
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
                            fontSize: 11.0,
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
                  children: [
                    Container(
                      width: 120.0,
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
                      width: 120.0,
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
                InkWell(
                  onTap: ()async {
                   await signInWithGoogle(context);
                  },
                  child: FormFeilds.continueWith(
                    title: 'Continue with google',
                    assetImage: 'assets/images/google.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  

 

  Future<void> buildLoginUser(context)async{
    try {
      FormFeilds.showLoading(context);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushNamedAndRemoveUntil(context, appPageLayout,(route) => false,);
      await FirebaseMessaging.instance.subscribeToTopic('all');
     /*  if(credential.user!.emailVerified){
      }else{
        Navigator.pop(context);
        FormFeilds.showMyDialog(
          context: context, 
          message: 'please confirem your email',
          actions: <Widget>[
            TextButton(
              onPressed: ()=> Navigator.of(context).pop(), 
              child: Text(
                'Okay',
                style: getBoldStyle(color: ColorTheme.wight,
                )
              ),
            ),
          ]
        );
      } */
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.of(context).pop();
        FormFeilds.showMyDialog(
          context: context, 
          message: 'No user found for that email.',
          actions: <Widget>[
            TextButton(
              onPressed: ()=> Navigator.of(context).pop(), 
              child: Text(
                'Okay',
                style: getBoldStyle(color: ColorTheme.wight,
                )
              ),
            ),
          ]  
        );
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Navigator.of(context).pop();
        FormFeilds.showMyDialog(
          context: context, 
          message: 'Wrong password provided for that user.',
          actions: <Widget>[
            TextButton(
              onPressed: ()=> Navigator.of(context).pop(), 
              child: Text(
                'Okay',
                style: getBoldStyle(color: ColorTheme.wight,
                )
              ),
            ),
          ]
        );
        debugPrint('Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential> signInWithGoogle(context) async {
      FormFeilds.showLoading(context);
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      if (credential.idToken == null) {
        Navigator.pop(context,(route) => false);
      } else {
        await FirebaseMessaging.instance.subscribeToTopic('all');
        Navigator.pushNamedAndRemoveUntil(context, appPageLayout,(route) => false,);
      }
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}