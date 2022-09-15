// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

class RegisterPage extends UserInterface{
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final comfirmPasswordController = TextEditingController();
  final jobsController = TextEditingController();
  final phoneController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  final  userCredential =  UserCredential; 
  RegisterPage({super.key});
  
  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 44, 12, 12),
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
              'Name',
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
                hintText: 'your Name', 
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
                keyboardType: TextInputType.emailAddress, 
                hintText:  'hello@company.com',
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
                hintText: 'your password',
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
                hintText: 'Confirm your password',
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
              child: InkWell(
                onTap: ()async{
                  try {
                    final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: 'mohamed.ashraf4117@gmail.com',
                      password: 'asdasdasdasd',
                    );
                    print(userCredential.user!.emailVerified);
                    if(userCredential.user!.emailVerified == false ){
                      User? user = FirebaseAuth.instance.currentUser;
                      await user?.sendEmailVerification().then((value) => Navigator.pushNamed(context, appPageLayout));
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                  // print(User.emailVerified);
                  //  print(serCredential.user!.emailVerified);
                  //   if(  serCredential.user!.emailVerified == false){}
                  // Navigator.pushNamed(context, appPageLayout);
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
            InkWell(
              onTap: ()async {
                UserCredential cred = await signInWithGoogle(context);
                  
                print(cred.toString());                
              },
              child: FormFeilds.continueWith(
                title: 'Continue with google',
                assetImage: 'assets/images/google.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle(context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    Navigator.pushNamed(context, appPageLayout);
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
   /* void buildLoginUser()async{
    try {
      // ignore: unused_local_variable
      UserCredential serCredential  = await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  } */
}