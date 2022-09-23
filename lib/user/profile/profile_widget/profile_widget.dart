// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    getData(context);
  }
  @override
  Widget build(BuildContext context) {
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
                      text:  'Liprary',
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
                'settengs',
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
                      text: 'Contact us',
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
                        text: '',
                        iconData: Icons.arrow_back_ios_new_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0 , 20, 22, 15),
              child: InkWell(
                onTap: () => logOut(context),
                child: Text(
                  'Log out',
                  style: getBoldStyle(color: ColorTheme.white, dDecoration: TextDecoration.none,),
                ),
              ),
            ),
            if(user!.uid == 'kk6Ujqw8ddYuFkj7VvJ6fVXMKDT2')
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: (){
                  Navigator.pushNamed(context, adminHome);
                },
                child: FormFeilds.buttonFormField(
                  dPadding: false,
                  title: 'Go to dashboard',
                  colorButton: ColorTheme.primary
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  logOut(context)async{
    await FirebaseAuth.instance.signOut();
    Navigator.restorablePushNamedAndRemoveUntil(context, loginPage, (route) => false);
  }
  getData(context)async {
      if(user!.uid == 'kk6Ujqw8ddYuFkj7VvJ6fVXMKDT2'){
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: (){
            Navigator.pushNamed(context, adminHome);
          },
          child: FormFeilds.buttonFormField(
            title: 'Go to dashboard',
            colorButton: ColorTheme.primary
          ),
        );
      }else{
        null ;
      }
      print(user!.uid);
      print('===========================');

    /* QuerySnapshot queryDocumentSnapshot = await users.get();
     List<QueryDocumentSnapshot> listdocs =  queryDocumentSnapshot.docs;
      listdocs.forEach((element) {
      print(element.data());
      print('===========================');
        
      }); */
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