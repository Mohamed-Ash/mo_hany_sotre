import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class PreviewOfferPage extends UserInterface{
  final ItemModel itemModel;

  const PreviewOfferPage({super.key, required this.itemModel});

  @override
  Widget buildBody(BuildContext context) {

    Object fiterOperatorr;
    
    if (itemModel.percent! < 10) {
      fiterOperatorr = itemModel.percent.toString().substring(0,1 );
    } else  if(itemModel.price == itemModel.offerPrice ){
      fiterOperatorr = 100 ;
    }else{
      fiterOperatorr = itemModel.percent.toString().substring(0,2);
    }
  /*   var fiterOperatorr  = itemModel.percent! < 10 ?  itemModel.percent.toString().substring(0,1 ) :  itemModel.percent.toString().substring(0,2);
    var fiterPercent = itemModel.price == itemModel.offerPrice ? 100 : itemModel.percent.toString().substring(0,2); */
    var fiterOfferPrice = itemModel.price == itemModel.offerPrice ? 'free' : "${itemModel.offerPrice} LE";
    
    return  SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              InkWell(
                onTap: (){
                  openImagesPage(Navigator.of(context),
                    imgUrls: [itemModel.image],
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
                        itemModel.image),
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
                width: 60,
                height: 25,
                decoration: BoxDecoration(
                  color: ColorTheme.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    '-$fiterOperatorr%',
                    style: getSemiBoldStyle(color: ColorTheme.wight, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Text.rich(
                TextSpan(
                  text: '${itemModel.price} LE',
                  style: TextStyle(
                    decoration: TextDecoration.combine([
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
                '$fiterOfferPrice LE',
                style: getBoldStyle(color: ColorTheme.wight,fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
         /*  Text(
            'Sale ends 9/27/2022 at 3:00 pm',
            style: getBoldStyle(color: ColorTheme.wight,fontSize: 14),
          ),
        CountDownText(
            due: DateTime.parse("${itemModel.dateOffer}"),
            finishedText: "",
            showLabel: true,
            longDateName: true,
            daysTextLong: " DAYS ",
            hoursTextLong: " HOURS ",
            minutesTextLong: " MINUTES ",
            secondsTextLong: " SECONDS ",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 22,
          ), */
          CountDownText(
            due: DateTime.parse("${itemModel.dateOffer}"),
            finishedText: "",
            showLabel: true,
            longDateName: true,
            daysTextLong: " days ",
            hoursTextLong: " hours ",
            minutesTextLong: " mins ",
            secondsTextLong: " secs ",
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
                width: 5,
              ),  
              Text(
                // '${widget.itemModel.price >= 1000 ? '${widget.itemModel.price.toString().substring(0,1)} k' :  widget.itemModel.price} Download',
                rangView(),
                style: getRegulerStyle(color: ColorTheme.authTitle,fontSize: 14),
              ),
              const SizedBox(
                width: 10,
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
          const Divider(
            color: ColorTheme.primary,
            thickness: 1,
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
                  Container(
                    width: 120,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Color(itemModel.colorPlatform),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        itemModel.platform,
                        style: getSemiBoldStyle(color: ColorTheme.wight, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: ColorTheme.primary,
              thickness: 1,
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
                      color: Color(itemModel.colorRegion),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        itemModel.region,
                          style: getSemiBoldStyle(color: ColorTheme.wight,),  
                      ),
                    ),
                  ),
                ],
              ),
            ),  
            const Divider(
              color: ColorTheme.primary,
              thickness: 1,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacementNamed(context, checkoutpage,arguments: itemModel),
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
    );
  }

  String rangView(){
    if (itemModel.price<= 1000) {
      return '${itemModel.price.toString().substring(0,1)} k Download';
    } else if(itemModel.price<= 10000) {
      return '${itemModel.price.toString().substring(0,2)} k Download';
    }else{
      return '${itemModel.price} Download';
    }
  }

  /* createButtonSheet(BuildContext context){
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
  } */
}