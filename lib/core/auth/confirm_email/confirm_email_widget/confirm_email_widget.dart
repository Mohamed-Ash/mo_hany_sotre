// ignore_for_file: avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class ConfirmEemailWidget extends StatefulWidget {
  const ConfirmEemailWidget({Key? key}) : super(key: key);

  @override
  State<ConfirmEemailWidget> createState() => _ConfirmEemailWidgetState();
}

class _ConfirmEemailWidgetState extends State<ConfirmEemailWidget> {
  bool isEmailVerified = false ;
  bool canEmailVerified = false ;
  Timer? timer;
  final  comfirmuser = FirebaseAuth.instance.currentUser;  
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified; 
    if (!isEmailVerified) {
      sendVerifcatonEmail();
      timer = Timer(const Duration(seconds: 3), () => chckEmailVerifid(),);
    } 
  }

 @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
       child: Padding(
        padding: const EdgeInsets.fromLTRB(12,45,12,22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FormFeilds.containerImage(assetImage: 'assets/images/email_campaign.png',height: 333,width: 333),
             const SizedBox(
              height: 40,
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
              height: 40,
            ),
            Wrap(
              spacing: 12,
              children:[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'We sent you an email with comfiremation link. Please confirem your emaile.',
                    style: getBoldStyle(
                      color: ColorTheme.hintText,
                      fontSize: 16
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            /* StreamBuilder(
              stream:comfirmuser,
              builder: (context, snapshot) {
                
              },
            ), */
                // confirmEmail();
              /*   StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder:(context, snapshot) {
                    if (canEmailVerified) {
                       debugPrint('succses');
                        
                      return Text(''); 
                    } else {
                       debugPrint('email not confrimed');
                      return const Text('');
                    }
                  }, 
                ), */
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, appPageLayout,);
               /*  // confirmEmail();
                  debugPrint(comfirmuser!.emailVerified.toString());
                if (comfirmuser!.emailVerified) {
                  debugPrint('true');
                } else {
                  debugPrint('email not confrimed');
                }*/
              },
              child: FormFeilds.buttonFormField(
                title: 'Go to home page',
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
         ),
     );
  }

   Future sendVerifcatonEmail()async{
    try {
      await comfirmuser!.sendEmailVerification();
    } catch (e) {
        debugPrint(e.toString());
    }
  }

 Future chckEmailVerifid()async{
    FirebaseAuth.instance.currentUser!.reload();
    setState(() {
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified; 
      
    });
    setState(() => canEmailVerified = false);
    Future.delayed(const Duration(seconds: 5));
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      setState(() {
        canEmailVerified = true;
        Navigator.pushNamedAndRemoveUntil(context, appPageLayout, (route) => false);
      });
      debugPrint('susscses');
      timer?.cancel();
    }
  }
}