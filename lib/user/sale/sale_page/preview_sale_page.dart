import 'package:flutter/material.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class PreviewSalePage extends UserInterface{
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

  PreviewSalePage({super.key});
  

  
  @override
  Widget buildBody(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8,22,8,8),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                InkWell(
                  onTap: (){
                    openImagesPage(
                      Navigator.of(context),
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
                    height: 350,
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
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    color: ColorTheme.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      '-20%',
                      style: getSemiBoldStyle(color: ColorTheme.wight, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                  Text.rich(
                  TextSpan(
                    text: '250 LE',
                    style: TextStyle(
                      decoration: TextDecoration.combine(
                        [
                          TextDecoration.lineThrough,
                          TextDecoration.lineThrough,
                        ],
                      ),
                      fontFamily: FontsTheme.fontFamily,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  '119.99 LE',
                  style: getBoldStyle(color: ColorTheme.wight,fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Sale ends 9/27/2022 at 3:00 pm',
              style: getBoldStyle(color: ColorTheme.wight,fontSize: 14),
            ),
            const SizedBox(
              height: 22,
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
                    'Rockstar Game',
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
          InkWell(
            onTap: () => createButtonSheet(context),
            child: FormFeilds.buttonFormField(
              title: 'Buy',
              colorButton: ColorTheme.primary,
              colorText: ColorTheme.wight,
              dPadding: false,
              heightButton: 50,
              widthtButton: 250,
            ),
          ),
          /* const SizedBox(
              height: 15,
            ),
            FormFeilds.buttonFormField(
              title: 'Buy',
              colorButton: ColorTheme.primary,
              colorText: ColorTheme.white,
              dPadding: false,
              heightButton: 50,
              widthtButton: 250,
            ), */
           /*  Container(
            width: double.infinity,
            height: 50,
            decoration:   BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: const Border(
                bottom: BorderSide(
                  width: 1,
                  color: ColorTheme.authHint
                ),
                left: BorderSide(
                  width: 1,
                  color: ColorTheme.authHint
                ),
                right: BorderSide(
                  width: 1,
                  color: ColorTheme.authHint
                ),
                top: BorderSide(
                  width: 1,
                  color: ColorTheme.authHint
                ),
              ),
            ),
            margin: const  EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: ListTile(
              trailing: FormFeilds.containerImage(assetImage: 'assets/images/cartt.png',height: 28,width: 28),
                title: Text(
                  'Add to Cart',
                  style: getSemiBoldStyle(color: ColorTheme.authHint),
                ),
                horizontalTitleGap: 33,
              ),
            ), */
          ],
        ),
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
}