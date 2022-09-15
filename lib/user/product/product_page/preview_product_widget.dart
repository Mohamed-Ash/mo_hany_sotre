// ignore_for_file: constant_identifier_names, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:image_preview/image_preview.dart';

// ignore: must_be_immutable
class PreviewProductWidget extends StatelessWidget {
  File? file;
  String text = '';
  String subject = '';
  String tetst =  'https://wallpaperaccess.com/full/7070020.jpg';
  bool videoEnable = false;
  ImagePicker picker = ImagePicker();
  List<String> imagePaths = [];

  final _imageUrls = <String>[
    'https://wallpaperaccess.com/full/7070020.jpg',
    'https://wallpaperaccess.com/full/7070020.jpg',
    'https://wallpaperaccess.com/full/7070020.jpg',
  ];

  final _imageOriginalUrls = <String>[
    'https://wallpaperaccess.com/full/7070020.jpg',
    'https://wallpaperaccess.com/full/7070020.jpg',
    'https://wallpaperaccess.com/full/7070020.jpg',
  ];

  PreviewProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              InkWell(
                onTap: (){
                  openImagesPage(Navigator.of(context),
                    imgUrls: _imageUrls,
                    imgOriginalUrls: _imageOriginalUrls,
                    index: 0,
                    heroTags: _imageUrls,
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
                  height: 333,
                  decoration: const BoxDecoration(
                    // borderRadius:BorderRadius.circular(8),
                    //  color: Colors.black,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        // 'https://amayei.nyc3.digitaloceanspaces.com/2020/09/Asala.jpg'
                        'https://wallpaperaccess.com/full/7070020.jpg'
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
                  'Fifa 22',
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
                      style: getSemiBoldStyle(color: ColorTheme.white, fontSize: 16),
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
            height: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FormFeilds.containerImage(assetImage: 'assets/images/Rockstar_Games.png'),
              FormFeilds.containerImage(assetImage: 'assets/images/eepic.png'),
              FormFeilds.containerImage(assetImage: 'assets/images/steam.png'),
              
            ],
          ),
          /* const SizedBox(
            height: 15,
          ),
          Text(
            '160 LE',
            style: getBoldStyle(color: Colors.white,fontSize: 26),
          ),
           */
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
                      createButtonSheet(context);
                    },
                    child: FormFeilds.buttonFormField(
                      title: 'Bye Now',
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
         /*  ListTile(
            leading: const Icon(Icons.add),
            title: Text('Add image',style: getBoldStyle(color: Colors.white,fontSize: 26),),
            onTap: () async {
              final imagePicker = ImagePicker();
              final pickedFile = await imagePicker.pickImage(
                source: ImageSource.gallery,
              );
              if (pickedFile != null) {
                setState(() {
                  imagePaths.add(pickedFile.path);
                });
              }
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 12.0)), */
          /* Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: text.isEmpty && imagePaths.isEmpty
                    ? null
                    : () => _onShare(context),
                child: Text('Share',style: getBoldStyle(color: Colors.white,fontSize: 26),),
              );
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 12.0)),
          Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: text.isEmpty && imagePaths.isEmpty
                    ? null
                    : () => _onShareWithResult(context),
                child:  Text('Share With Result',style: getBoldStyle(color: Colors.white,fontSize: 26),),
              );
            },
          ), */
          const SizedBox(
            height: 33,
          ),
        ],
      ),
    );
  }


  createButtonSheet(BuildContext context){
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) =>Container(
        width: double.infinity,
        height: 400,
        decoration: const BoxDecoration(
          color: ColorTheme.darkAppBar,
          borderRadius:  BorderRadius.only(
            topLeft:  Radius.circular(44.0),
            topRight:  Radius.circular(44.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 12, 0),
          child: Column(
            children: [
              FormFeilds.containerImage(assetImage: 'assets/images/insert_card.png',height: 100,width: 100),
              const SizedBox(
                height: 33,
              ),
              ListTile(
                leading: FormFeilds.containerImage(assetImage: 'assets/images/eepic.png'),
                title: Text(
                  'Buy Account Epic',
                  style: getSemiBoldStyle(color: Colors.white),
                ),
                trailing: InkWell(
                  onTap: (){
                    // onButtonTap(Share.share_system);
                    Navigator.pushNamed(context, checkoutpage);
                  },
                  child: FormFeilds.buttonFormField(
                    title: 'send request',
                    colorButton: ColorTheme.primary, 
                    fontSize: 14,
                    widthtButton: 100,
                    dPadding: false,
                  ),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              ListTile(
                leading: FormFeilds.containerImage(assetImage: 'assets/images/steam.png'),
                title:  Text(
                  'Buy Account Steam',
                  style: getSemiBoldStyle(color: Colors.white),
                ),
                trailing: InkWell(
                  onTap: (){
                    // FlutterShareMe().shareToWhatsApp(fileType: pickImage() )
                    Navigator.pushNamed(context, checkoutpage);
                  },
                  child: FormFeilds.buttonFormField(
                    title: 'send request',
                    colorButton: ColorTheme.primary, 
                    fontSize: 14,
                    widthtButton: 100,
                    dPadding: false,
                  ),
                ),
              ),
               const SizedBox(
                height: 33,
              ),
              ListTile(
                leading: FormFeilds.containerImage(assetImage: 'assets/images/Rockstar_Games.png'),
                title:  Text(
                  'Buy Account Rockstar',
                  style: getSemiBoldStyle(color: Colors.white),
                ),
                
                trailing: InkWell(
                  onTap: (){
                    // Share.share('https://www.facebook.com/messages/t/100011453740152');
                    Navigator.pushNamed(context, checkoutpage);
                  },
                  child: FormFeilds.buttonFormField(
                    title: 'send request',
                    colorButton: ColorTheme.primary, 
                    fontSize: 14,
                    widthtButton: 100,
                    dPadding: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );// 28f@Ge4p9NDUwXX  password(fawry)
  }



/*   Future<void> onButtonTap(Share share) async { 
    String msg = 'pay account epic $tetst';
    String url =  'pay account epic adads';

    String? response;
    final FlutterShareMe flutterShareMe = FlutterShareMe();
    switch (share) {
      case Share.facebook:
        response = await flutterShareMe.shareToFacebook(url: url, msg: msg,);
        break;
      case Share.messenger:
        response = await flutterShareMe.shareToMessenger(url: url, msg: msg);
        break;
      case Share.twitter:
        response = await flutterShareMe.shareToTwitter(url: url, msg: msg);
        break;
      case Share.whatsapp:
        if (file != null) {
          response = await flutterShareMe.shareToWhatsApp(
              imagePath: file!.path,
              fileType: videoEnable ? FileType.video : FileType.image);
        } else {
          response = await flutterShareMe.shareToWhatsApp(msg: msg);
        }
        break;
      case Share.whatsapp_business:
        response = await flutterShareMe.shareToWhatsApp(msg: msg);
        break;
      case Share.share_system:
        response = await flutterShareMe.shareToSystem(msg: msg);
        break;
      case Share.whatsapp_personal:
        response = await flutterShareMe.shareWhatsAppPersonalMessage(
            message: msg, phoneNumber: 'phone-number-with-country-code');
        break;
      case Share.share_instagram:
        response = await flutterShareMe.shareToInstagram(
            filePath: file!.path,
            fileType: videoEnable ? FileType.video : FileType.image);
        break;
      case Share.share_telegram:
        response = await flutterShareMe.shareToTelegram(msg: msg);
        break;
    }
    debugPrint('asdadasd$response');
  } */
  /*  void _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox?;

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  } */

  /* void _onShareWithResult(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    ShareResult result;
    if (imagePaths.isNotEmpty) {
      result = await Share.shareFilesWithResult(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      result = await Share.shareWithResult(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
    ScaffoldMessenger.of( context).showSnackBar(
      SnackBar(
      content: Text("Share result: ${result.status}"),
    ));
  }

   void _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
    });
  } */
 
}




/*  Container(
                  width: 88,
                  height: 25,
                  decoration: BoxDecoration(
                    color: ColorTheme.steam,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'steam',
                      style: getSemiBoldStyle(color: ColorTheme.textSteam, fontSize: 16),
                    ),
                  ),
                ), */
                /* Container(
                  width: 88,
                  height: 25,
                  decoration: BoxDecoration(
                    color: ColorTheme.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Epic',
                      style: getSemiBoldStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 88,
                  height: 25,
                  decoration: BoxDecoration(
                    color: ColorTheme.rockStar,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Rock Star',
                      style: getSemiBoldStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ), */