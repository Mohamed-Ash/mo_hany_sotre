// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/user_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class HomeWidget extends StatefulWidget {
  late ApiDataBloc<CategoryModel> categoryBloc;
  late ApiDataBloc<UserModel> userModel;
  
  HomeWidget({Key? key,required this.categoryBloc, required this.userModel}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {



  @override
  void initState() {
    super.initState();
    
    /* FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('========================================token=========================================');
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
        print('Message also contained a notification: ${message.notification!.body}');
      print('========================================token=========================================');
        Navigator.pushNamed(context,topicPage);
      // if (message.notification != null) {
      // }
    }); */
    FirebaseMessaging.onMessage.listen((event) {
      print('================= event data =================');
      print(event.notification!.body.toString());
      print('=====================================');
    });
    // initialMessage();
    widget.categoryBloc= ApiDataBloc()..add(const IndexDataEvent());
  }
/* 
  initialMessage()async{
    var messg = await FirebaseMessaging.instance.getInitialMessage();
    if (messg != null ) {
      // ignore: use_build_context_synchronously
      // Navigator.pushNamed(context,topicPage);
    }
  } */

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                image: AssetImage('assets/images/bannar.jpg')
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder(
            bloc: widget.categoryBloc,
            builder: (context, state) {
              if(state is DataLoadingState){
                return  const Center(child: CircularProgressIndicator(color: ColorTheme.primary),);
              } else if(state is DataLoadedState){
                if ( state.data.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FormFeilds.containerImage(assetImage: 'assets/images/waiting_pana.png',height: 200,width: 200),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Wait for a new Categories to be uploaded',
                          style: getBoldStyle(color: ColorTheme.wight,fontSize: 14),
                        ),
                      ],
                    ),
                  );
                }else{
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2/3,
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context,index) {
                      return buildCategories(
                        context: context,
                        categoriesModel: state.data[index],
                      );
                    } ,
                    itemCount: state.data.length,
                  );
                }
              } else {
                return Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),);
              }        
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
  
  Widget buildCategories({
    required BuildContext context,
    required  CategoryModel categoriesModel
  }){
    return InkWell(
      onTap: (){
         Navigator.pushNamed(context, productPagse,arguments: categoriesModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: 180,
          height: 250, 
          child: PhysicalModel(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.black,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            child:FadeInImage.assetNetwork(
              placeholder: 'assets/icons/lloading.gif',
              image: '${categoriesModel.image}',
              fit: BoxFit.fill,
              placeholderFit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
  Future<void> saveTokenToDatabase(String token) async {
  final userId = FirebaseAuth.instance.currentUser;

  await FirebaseFirestore.instance
    .collection('usersid')
    .doc(userId!.uid)
    .set({
      'tokens': FieldValue.arrayUnion([token]),
    });
}

 Future<void> setupToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    
    await saveTokenToDatabase(token!);

    FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
  }
}