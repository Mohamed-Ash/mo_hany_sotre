// ignore_for_file: constant_identifier_names, avoid_print


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:image_preview/image_preview.dart';

// ignore: must_be_immutable
class PreviewProductWidget extends StatefulWidget {
  final  ItemModel itemModel;
  
  
  const PreviewProductWidget({super.key,required this.itemModel});

  @override
  State<PreviewProductWidget> createState() => _PreviewProductWidgetState();
}

class _PreviewProductWidgetState extends State<PreviewProductWidget> {
  Timer? countdownTimer;
  Duration myDuration = const Duration(days: 5);

/*   @override
  void initState() {
    super.initState();
    countdownTimer =  Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }
  void setCountDown(){
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      }else{
        myDuration = Duration(seconds: seconds);
      }
    });
  } */
  @override
  Widget build(BuildContext context) {
   
    return buildItem(context: context);  
    /* if (widget.itemModel.offerPrice == '2222') {
    }else{
      return buildOfferItem(context: context,);
    } */
  }

  Widget buildItem({required BuildContext context,}){
  
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              InkWell(
                onTap: (){
                  openImagesPage(Navigator.of(context),
                    imgUrls: [widget.itemModel.image],
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        widget.itemModel.image
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
                  widget.itemModel.name,
                  style: getBoldStyle(color: Colors.white,fontSize: 19),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18,0,0,0),
                  child: Text(
                    '${widget.itemModel.price} LE',
                    style: getBoldStyle(color: Colors.white,fontSize: 26),
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
          const Padding(
            padding: EdgeInsets.fromLTRB(2,2,2,2),
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
                    style: getRegulerStyle(color: ColorTheme.hintText,),  
                  ),
                  const Spacer(),
                  Container(
                  width: 120,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Color(widget.itemModel.colorPlatform),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      widget.itemModel.platform,
                      style: getSemiBoldStyle(color: ColorTheme.wight, fontSize: 16),
                    ),
                  ),
                ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(2,2,2,2),
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
                    'Region',
                    style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 13),  
                  ),
                  const Spacer(),
                  Container(
                    width: 120,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Color(widget.itemModel.colorPlatform),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        widget.itemModel.region,
                          style: getSemiBoldStyle(color: ColorTheme.wight,),  
                      ),
                    ),
                  ),
                ],
              ),
            ),  
            const Padding(
              padding: EdgeInsets.fromLTRB(2,2,2,2),
              child: Divider(
                color: ColorTheme.primary,
                thickness: 1,
              ),
            ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, checkoutpage);
            },
            child: FormFeilds.buttonFormField(
              title: 'Buy Now',
              colorButton: ColorTheme.primary, 
              fontSize: 15,
              // widthtButton: 100,
              dPadding: true,
            ),
          ),
          const SizedBox(
            height: 33,
          ),
        ],
      ),
    );
  }

  Widget buildOfferItem({required BuildContext context,}){
    
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final days = strDigits(myDuration.inDays.remainder(widget.itemModel.dayTimeOffer as int));
    final hours = strDigits(myDuration.inHours.remainder(widget.itemModel.hourTimeOffer as int));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    
    return SingleChildScrollView(
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
                      imgUrls: [widget.itemModel.image],
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        widget.itemModel.image
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
                    text: '${widget.itemModel.price} LE',
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
                  '${widget.itemModel.price} LE',
                  style: getBoldStyle(color: ColorTheme.wight,fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '$days:$hours:$minutes:$seconds',
              style: getBoldStyle(color: ColorTheme.wight,fontSize: 33),),
            // Text(
            //   // 'Sale ends 9/27/2022 at 3:00 pm',
            //   '$days:',
            //   style: getBoldStyle(color: ColorTheme.wight,fontSize: 14),
            // ),
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
              // onTap: () => createButtonSheet(context),
              child: FormFeilds.buttonFormField(
                title: 'Buy',
                colorButton: ColorTheme.primary,
                colorText: ColorTheme.wight,
                dPadding: false,
                heightButton: 50,
                widthtButton: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }
}