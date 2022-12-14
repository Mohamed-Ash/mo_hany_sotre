// ignore_for_file: avoid_print, unrelated_type_equality_checks

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/helper/next_id_helper.dart';
import 'package:m_hany_store/core/model/user_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class RegisterWidget extends StatefulWidget {
  final ApiDataBloc<UserModel> userBloc;

  const RegisterWidget({Key? key,required this.userBloc}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  bool showPassword = true;
  bool showConfirmPassword = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final comfirmPasswordController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser;
  final userCredential =  UserCredential; 
  final formKye = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 44, 12, 12),
        child: Form(
          key: formKye,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'welcome to M.Hany store',
                style: getBoldStyle(
                  color: ColorTheme.wight,
                  dDecoration: TextDecoration.none,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
             /*  Text(
                'Name',
                style: getSemiBoldStyle(
                  color: ColorTheme.wight,
                  fontSize: 14
                ),
              ),
              const SizedBox(
                height: 24,
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
                  FormFeilds.textField(
                    keyboardType: TextInputType.name, 
                    controller: nameController, 
                    hintText: 'your Name', 
                    validator: (vail){
                      if(vail!.isEmpty) {
                        return 'please add your name';
                      }
                      return null ;
                    },
                  ),
                ],
              ), */
              const SizedBox(
                height: 24,
              ),
              Text(
               'Email',
                style: getSemiBoldStyle(
                  color: ColorTheme.wight,
                  fontSize: 14
                ),
              ),
              const SizedBox(
                height: 24,
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
                    controller: emailController, 
                    keyboardType: TextInputType.emailAddress, 
                    hintText:  'hello@company.com',
                    validator: (validate){
                      if(validate!.isEmpty){
                        return 'Please Enter your Email';
                      }else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(validate)){
                        return 'Please a valid Email';
                      }else if(validate.hashCode == 'email-already-in-use'){
                        return 'The account already exists for that email.';
                      }
                      return null;
                    }
                  ),
                ],
              ),
               const SizedBox(
                height: 24,
              ),
              Text(
                'Password',
                style: getSemiBoldStyle(
                  color: ColorTheme.wight,
                  fontSize: 14
                ),
              ),
              const SizedBox(
                height: 24,
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
                    controller: passwordController, 
                    keyboardType: TextInputType.visiblePassword, 
                    obscureText: showPassword,
                    hintText: 'your password',
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
                      icon: showPassword == true
                        ? FormFeilds.containerImage(assetImage: 'assets/icons/eye.png') 
                        : FormFeilds.containerImage(assetImage: 'assets/icons/closed_eye.png') 
                    ),
                  ),
                ],
              ),
                const SizedBox(
                height: 24,
              ),
              Text(
               'Confirm Password',
                style: getSemiBoldStyle(
                  color: ColorTheme.wight,
                  fontSize: 14
                ),  
              ),
              const SizedBox(
                height: 18,
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
                    controller: comfirmPasswordController, 
                    keyboardType: TextInputType.visiblePassword, 
                    obscureText: showConfirmPassword,
                    hintText: 'Confirm your password',
                    validator: (value){
                      if(value == null){
                        return 'Confirm Password';
                      }else if(value.length < 6){
                        return 'Confirm Password does  not match' ;
                      }
                      else if(passwordController.text != comfirmPasswordController.text){
                        return 'Confirm Password does not match';
                      }else{
                        return null;
                      }
                    },
                    suffixIcon: IconButton(
                      splashColor: Colors.transparent,
                      
                      onPressed: (){
                        setState(() {
                          showConfirmPassword = !showConfirmPassword ; 
                        });  
                      }, 
                      icon: showConfirmPassword == true
                        ? FormFeilds.containerImage(assetImage: 'assets/icons/eye.png') 
                        : FormFeilds.containerImage(assetImage: 'assets/icons/closed_eye.png') 
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                child: InkWell(
                  onTap: ()async{
                    if(formKye.currentState!.validate()){
                      buildResister(context);
                    }
                  },
                  child: FormFeilds.buttonFormField(
                    title: 'Create New Accounte',
                    colorButton: ColorTheme.primary,
                    colorText: ColorTheme.wight,
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
                    style: getSemiBoldStyle(color: ColorTheme.hintText,fontSize: 12),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(//'?????????? ????????????',
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
                    style: getSemiBoldStyle(color: ColorTheme.hintText),
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
            /*   FormFeilds.continueWith(
                title: 'Continue with facebook',
                assetImage: 'assets/images/facebook.png',
              ), */
              // const SizedBox(height: 22,),
              InkWell(
                onTap: ()async {
                  UserCredential cred = await signInWithGoogle(context);
                  debugPrint(cred.toString());                
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
    );
  }

  Future<void> buildResister(context)async{
    try {
      FormFeilds.showLoading(context);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      String id = await NextIdHelper.getNextId('user');
      UserModel data = UserModel(
        id: id,
        email: emailController.text,
      );
      await FirebaseMessaging.instance.subscribeToTopic('all');
      widget.userBloc.add(StoreDataEvent(data: data.tojson()));
      Navigator.pushNamedAndRemoveUntil(context, confirmEmailPage, (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Navigator.of(context).pop();
        FormFeilds.showMyDialog(
          context: context,
          message: 'The password provided is too weak.',
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
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Navigator.of(context).pop();
        FormFeilds.showMyDialog(
          context: context,
          message: 'The account already exists for that email.',
          actions: <Widget> [
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
        debugPrint('The account already exists for that email.');
      }
      
    } catch (e) {
      debugPrint(e.toString());
    }  
  }
  
  Future<UserCredential> signInWithGoogle(context) async {
    FormFeilds.showLoading(context);
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    if (credential.idToken == null) {
      Navigator.pop(context,(route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, appPageLayout,(route) => false,);
    }
      // String id = await NxextIdHelper.getNextId('user');
      UserModel data = UserModel(
        id:googleUser!.id,
        email: googleUser.email,
      );
      await FirebaseMessaging.instance.subscribeToTopic('all');
      widget.userBloc.add(StoreDataEvent(data: data.tojson()));
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}