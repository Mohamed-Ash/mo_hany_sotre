// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/admin_model.dart';
import 'package:m_hany_store/core/model/user_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ProfileWidget extends StatefulWidget {
  final ApiDataBloc<AdminModel> adminModel;
  final ApiDataBloc<UserModel> userModel;

  const ProfileWidget({Key? key, required this.adminModel, required this.userModel}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  Future<void>? launched;
  Uri phone  = Uri.parse('tel:+201068693963'); 
  
  final user = FirebaseAuth.instance.currentUser;
  final Uri toLaunchFacbook = Uri(scheme: 'https', host: 'fb.me', path: '/mhany.store');
  final Uri toLaunchMessenger = Uri(scheme: 'https', host: 'm.me', path: '/MuhamedElnaashar');
  final Uri toLaunchDiscord = Uri(scheme: 'https', host: 'discord.com', path: '/invite/ZNbkzxhfxn');
  final Uri toLaunchWhatsapp = Uri(scheme: 'https', host: 'wa.me', path: '/201068693963');


// https://www.facebook.com/messages/t/103525794476793
  
  // var users = FirebaseFirestore.instance.collection('admin');
  // List getAdmin = [];
/*   @override
  void initState() {
    super.initState();
    getData();
    // widget.adminModel = ApiDataBloc<AdminModel>()..add(const IndexDataEvent());
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async{
                        if (await launchUrl(phone)) {}
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
              bloc: widget.adminModel,
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
                  return Container();
                }else {
                  return const Text('404');
                }
              } 
            ),
            const SizedBox(height: 35,)
          ],
        ),
      ),
    );
  }

  Widget buildAdminButton({
    required AdminModel adminModel,
    required BuildContext context,
  }){
    print('=====================');
    print(adminModel.email.toString());
    if (user!.email == adminModel.email ){
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
    await FirebaseMessaging.instance.unsubscribeFromTopic('all');
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, loginPage, (route) => false);
    // Navigator.pushReplacementNamed(context, loginPage);
  }
}  