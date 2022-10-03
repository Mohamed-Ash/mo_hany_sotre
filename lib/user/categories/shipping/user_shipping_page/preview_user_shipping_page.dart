import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class PreviewUserShippingPage extends UserInterface{
  File? file;
  /* String text = '';
  String subject = '';
  String tetst =  'https://wallpaperaccess.com/full/7070020.jpg'; */
  bool videoEnable = false;
  List products = [];
  List<String> imagePaths = [];
  CollectionReference getAllProductSale = FirebaseFirestore.instance.collection('categories').doc('5144z0GZ5BA4m8riyX4D').collection('shipping');

  final String id;
  final DocumentSnapshot shipping;
 
  PreviewUserShippingPage({super.key,required this.id,required this.shipping,});

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              InkWell(
                onTap: (){
                  openImagesPage(
                    Navigator.of(context),
                    imgUrls: [shipping['image']],
                    index: 0,
                    onLongPressHandler: (con, url) => debugPrint(url),
                    onPageChanged: (i, widget) async {
                      if (widget != null) return widget;
                      await Future.delayed(const Duration(seconds: 3));
                      return null ;
                    }
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration:  BoxDecoration(
                    // borderRadius:BorderRadius.circular(8),
                    //  color: Colors.black,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        // 'https://amayei.nyc3.digitaloceanspaces.com/2020/09/Asala.jpg'
                        shipping['image']
                        //'https://media-rockstargames-com.akamaized.net/rockstargames-newsite/img/global/games/fob/1280/V.jpg
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 33, 0, 0),
                child: Container(
                  width: 44,
                  height: 44  ,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(78, 48, 48, 49),
                    borderRadius: BorderRadius.circular(55),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: (() => Navigator.pop(context)),
                    ),
                  ),
                ),
              ),
            ], 
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 15, 14, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  shipping['name'],
                  style: getBoldStyle(color: Colors.white,fontSize: 19),
                ),
                Container(
                  width: 120,
                  height: 25,
                  decoration: BoxDecoration(
                    color: ColorTheme.titleTypePlay,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Sports',
                      style: getSemiBoldStyle(color: ColorTheme.wight, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormFeilds.containerImage(assetImage: 'assets/images/download.png',height: 22,width: 22),
              const SizedBox(
                width: 10,
              ),
              Text(
                '20K Download',
                style: getRegulerStyle(color: ColorTheme.authTitle,fontSize: 14),
              ),
               const SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 22,
                decoration: const BoxDecoration(
                  color: ColorTheme.authTitle,
                ),
              ),
               const SizedBox(
                width: 10,
              ),
              FormFeilds.containerImage(assetImage: 'assets/images/winner.png',height: 28,width: 28),
              // FormFeilds.containerImage(assetImage: 'assets/images/download.png',height: 28,width: 28),
              const SizedBox(
                width: 10,
              ),
              Text(
                '99 Matchs',
                style: getRegulerStyle(color: ColorTheme.authTitle,fontSize: 14),
              ),
            ],
          ),
         
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 15, 14, 15),
            child: Text(
              'In this section you can find all of FIFA\'s'
              'official documents downloadable in PDF format.'
              'From archived financial reports to published'
              'circulars, on subjects as diverse at the Laws'
              ' of the Game, the regulations of each and every'
              'FIFA tournament, technical reports or even security'
              'regulations, this collection of PDFs available online'
              'via FIFA.com has been collated and organised to help you'
              'find exactly the documents you are looking for.',
              style: getRegulerStyle(
                color: ColorTheme.authTitle,
                fontSize: 14
              ),  
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(18,18,18,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Accounts Available On',
                    style: getRegulerStyle(color: ColorTheme.hintText,),  
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      FormFeilds.containerImage(assetImage: 'assets/images/Rockstar_Games.png',height: 25,width: 25,),
                      FormFeilds.containerImage(assetImage: 'assets/images/eepic.png',height: 25,width: 25,),
                      FormFeilds.containerImage(assetImage: 'assets/images/steam.png',height: 25,width: 25,),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(12,12,12,12),
              child: Divider(
                color: ColorTheme.primary,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18,0,18,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Publisher',
                    style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 13),  
                  ),
                  const Spacer(),
                  Text(
                    shipping['platForm'],
                    style: getSemiBoldStyle(color: ColorTheme.wight,),  
                  ),
                ],
              ),
            ),  
            const Padding(
              padding: EdgeInsets.fromLTRB(12,12,12,12),
              child: Divider(
                color: ColorTheme.primary,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18,0,18,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Platform',
                    style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 13),  
                  ),
                  const Spacer(),
                 FormFeilds.containerImage(assetImage: 'assets/images/windows.png',height: 15,width: 15,),
                 const SizedBox(
                  width: 2,
                 ),
                 FormFeilds.containerImage(assetImage: 'assets/images/apple.png',height: 15,width: 15,),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(12,12,12,12),
              child: Divider(
                color: ColorTheme.primary,
                thickness: 1,
              ),
            ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18,0,0,0),
                child: Text(
                  '160 LE',
                  style: getBoldStyle(color: Colors.white,fontSize: 26),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      // createButtonSheet(context);
                    },
                    child: FormFeilds.buttonFormField(
                      title: 'Buy Now',
                      colorButton: ColorTheme.primary, 
                      fontSize: 15,
                      widthtButton: 100,
                      dPadding: false,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                    },
                    child: FormFeilds.containerImage(
                      assetImage: 'assets/images/shopping.png',
                      height:35,
                      width: 35,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 33,
          ),
        ],
      ),
    );
  }
}