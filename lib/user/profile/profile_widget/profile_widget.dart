// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/admin_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ProfileWidget extends StatefulWidget {
  ApiDataBloc<AdminModel>? adminBloc;

  ProfileWidget({Key? key, required this.adminBloc}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  AdminModel? adminModel;
  Future<void>? launched;
  Uri phone  = Uri.parse('tel:+201115506613'); 
  
  final user = FirebaseAuth.instance.currentUser;
  final Uri toLaunchFacbook = Uri(scheme: 'https', host: 'fb.me', path: '/mhany.store');
  final Uri toLaunchMessenger = Uri(scheme: 'https', host: 'm.me', path: '/MuhamedElnaashar');
  final Uri toLaunchDiscord = Uri(scheme: 'https', host: 'discord.com', path: '/invite/ZNbkzxhfxn');
  final Uri toLaunchWhatsapp = Uri(scheme: 'https', host: 'wa.me', path: '/201115506613');


// https://www.facebook.com/messages/t/103525794476793
  
  // var users = FirebaseFirestore.instance.collection('admin');
  // List getAdmin = [];
/*   @override
  void initState() {
    super.initState();
    getData();
    // widget.adminBloc = ApiDataBloc<AdminModel>()..add(const IndexDataEvent());
  } */
    Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication,)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 15, 15),
              child: Text(
                'My Profile',
                style: getBoldStyle(color: ColorTheme.wight),
              ),
            ), */
            /* Container(
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
                        isImage: false,
                        text: 'Personal info', 
                        iconData: Icons.arrow_forward_ios_sharp,
                        iconSize: 16,
                      ),
                    ),
                    /* const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        color: ColorTheme.primary,
                        thickness: 1,
                      ),
                    ),
                    FormFeilds.rowTextIcon(
                      isImage: false,
                      // firstIconData: Icons.favorite_border_rounded,
                      // firstIconImage: 'assets/icons/purse.png',
                      text:  'Liprary',
                      iconData:  Icons.arrow_forward_ios_sharp,
                    ), */
                  ],
                ),
              ),
            ), */
            Padding(
              padding: const EdgeInsets.fromLTRB( 0, 20, 15, 15),
              child: Text(
                'security settings',
                style: getBoldStyle(color: ColorTheme.wight, dDecoration: TextDecoration.none,),
              ),
            ),
            Container(
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
                        Navigator.pushNamed(context, resetPasswordPage);
                      },
                      child: FormFeilds.rowTextIcon(
                        isImage: true,
                        text: 'Change passord',
                        firstIconImage: 'assets/icons/password.png',
                        iconData: Icons.arrow_forward_ios_sharp,
                        iconSize: 16,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        color: ColorTheme.primary,
                        thickness: 1,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, resetEmailPage);
                      },
                      child: FormFeilds.rowTextIcon(
                        isImage: true,
                        // firstIconData: Icons.favorite_border_rounded,
                        firstIconImage: 'assets/icons/email.png',
                        text:  'Change Email ',
                        iconData:  Icons.arrow_forward_ios_sharp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB( 0, 20, 15, 15),
              child: Text(
                'Contact us',
                style: getBoldStyle(color: ColorTheme.wight, dDecoration: TextDecoration.none,),
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
                    InkWell(
                      onTap: () async{
                      
                        if (await launchUrl(phone)) {
                          
                        } else {
                          
                        }
                      },
                      child: FormFeilds.rowTextIcon(
                        isImage: true,
                        text: 'call phone',
                        firstIconImage: 'assets/icons/phone.png',
                        iconData: Icons.arrow_forward_ios_sharp,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        color: ColorTheme.primary,
                        thickness: 1,
                      ),
                    ),
                    InkWell(
                      onTap: () =>  setState(() {
                        launched = _launchInBrowser(toLaunchDiscord);
                      }),
                      child: FormFeilds.rowTextIcon(
                        isImage: true,
                        text: 'Discord',
                        firstIconImage: 'assets/images/discord.png',
                        iconData: Icons.arrow_forward_ios_sharp,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        color: ColorTheme.primary,
                        thickness: 1,
                      ),
                    ),
                    InkWell(
                      onTap: () =>  setState(() {
                        launched = _launchInBrowser(toLaunchFacbook);
                      }),
                      child: FormFeilds.rowTextIcon(
                        isImage: true,
                        firstIconImage: 'assets/images/facebook.png',
                        text: 'facebook page',
                        iconData: Icons.arrow_forward_ios_sharp,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        color: ColorTheme.primary,
                        thickness: 1,
                      ),
                    ),
                    InkWell(
                      onTap: () =>  setState(() {
                        launched = _launchInBrowser(toLaunchMessenger);
                      }),
                      child: FormFeilds.rowTextIcon(
                        isImage: true,
                        firstIconImage: 'assets/images/messenger.png',
                        // iconSize: 44,
                        text: 'massenger',
                        iconData: Icons.arrow_forward_ios_sharp,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        color: ColorTheme.primary,
                        thickness: 1,
                      ),
                    ),
                    InkWell(
                      onTap: () =>  setState(() {
                        launched = _launchInBrowser(toLaunchWhatsapp);
                      }),
                      child: FormFeilds.rowTextIcon(
                        isImage: true,
                        text: 'whats app',
                        firstIconImage: 'assets/images/whatsapp.png',
                        iconData: Icons.arrow_forward_ios_sharp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(0 , 33, 22, 33),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  FormFeilds.showMyDialog(
                    context: context,
                    message: 'Are you sure you want to logout',
                    tabButton: true,
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'cancle',
                          style: getBoldStyle(color: ColorTheme.wight, dDecoration: TextDecoration.none, fontSize: 14 ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => logOut(context),
                        child: Text(
                          'ok',
                          style: getBoldStyle(color: ColorTheme.wight, dDecoration: TextDecoration.none, fontSize: 14 ),
                        ),
                      ),
                    ],
                  );
                },
                child: Row(
                  children: [
                    FormFeilds.containerImage(assetImage: 'assets/icons/logout.png',width: 35,height: 35),
                     Text(
                        'Log out',
                        style: getSemiBoldStyle(color: const Color(0xffE74C3C),fontSize: 18, dDecoration: TextDecoration.none,),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder(
              bloc: widget.adminBloc,
              builder: (context, state) {
                if (state is DataLoadedState) {
                  return ListView.builder(
                    shrinkWrap: true ,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return buildAdminButton(adminModel: state.data[index], context: context);
                    },
                  );
                }else if(state is DataLoadingState){
                  return const CircularProgressIndicator();
                }else {
                  return const Text('404');
                }
              } 
            ),
            const SizedBox(height: 35,)
            /* StreamBuilder(
              stream: users.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true ,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      if (snapshot.data!.docs[index]['admin_id'] == user!.uid) {
                        print('=====================');
                        print(snapshot.data!.docs[index]['admin_id'].toString());
                        print('=====================');
                        return  InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: (){
                            Navigator.pushNamed(context, categoriesPage);
                          },
                          child: FormFeilds.buttonFormField(
                            dPadding: false,
                            title: 'Go to dashboard',
                            colorButton: ColorTheme.primary,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                  
                } else {
                  return Container();
                }
              } ,
            ), */
          ],
        ),
      ),
    );
  }
  buildAdminButton({
     required AdminModel adminModel,
     required BuildContext context,
  }){
    print('=====================');
    print(adminModel.adminId.toString());
    if (adminModel.adminId == user!.uid){
      return InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: (){
          Navigator.pushNamed(context, adminHome);
        },
        child: FormFeilds.buttonFormField(
          dPadding: false,
          title: 'Go to dashboard',
          colorButton: ColorTheme.primary,
        ),
      ); 
    }else {
      return Container();
    }
  }

  logOut(context)async{
    await FirebaseAuth.instance.signOut();
    // Navigator.restorablePushNamedAndRemoveUntil(context, loginPage, (route) => false);
    Navigator.pushReplacementNamed(context, loginPage);
  }
}  
//   getData()async{
//     try {
//       var userss = await users.get();
//       for (var element in userss.docs) {
//         getAdmin.add(element.data());
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
 /*  StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (userSnapshot.connectionState == ConnectionState.done) {
                  if (!userSnapshot.hasData) {
                   return const Text('user');
                  }
                  else if (userSnapshot.data == "uidOfYourAdminUser") {
                    return const Text('admin');
                  }else{
                    return const Text('user');
                  }
                }
                return Container();
              }
            ) */
            /* if(user!.uid.toString() == 'uO7W8tArnkTNDR6lJ6yOK553vXt2')
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: (){
                  Navigator.pushNamed(context, categoriesPage);
                },
                child: FormFeilds.buttonFormField(
                  dPadding: false,
                    title: 'Go to dashboard',
                    colorButton: ColorTheme.primary
                  ),
              )
            else
              Container() , */
           /*  BlocBuilder(
              bloc: widget.adminBloc,
              builder: (context, state) {
                if (state is DataLoadedState) {
                  if( state.data == user!.uid ){
                    return InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: (){
                        Navigator.pushNamed(context, categoriesPage);
                      },
                      child: FormFeilds.buttonFormField(
                        dPadding: false,
                          title: 'Go to dashboard',
                          colorButton: ColorTheme.primary
                        ),
                    );
                  }else{
                    return Container() ; 
                  }
                  /* return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder:(context, index) => readDashboard(adminModel: state.data[index]),
                  ); */
                } else if(state is DataLoadingState){
                  return  const Center(child: CircularProgressIndicator(color: ColorTheme.primary),);
                } else{
                  return Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),);
                }
              }
            ), */