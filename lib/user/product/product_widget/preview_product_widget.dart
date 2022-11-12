// ignore_for_file: constant_identifier_names, avoid_print


import 'dart:async';

import 'package:date_count_down/date_count_down.dart';
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
    // var fiterOfferPrice = itemModel.price == itemModel.offerPrice ? 'free' : "${itemModel.offerPrice} LE";
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
/*   String rangView(){
    if (widget.itemModel.price<= 1000) {
      return '${widget.itemModel.price.toString().substring(0,1)} k Download';
    } else if(widget.itemModel.price<= 10000) {
     return '${widget.itemModel.price.toString().substring(0,2)} k Download';
    }else{
      return '${widget.itemModel.price} Download';
    }
  } */
  
  @override
  Widget build(BuildContext context) {
   
    if (widget.itemModel.isOffer == true) {
      return buildOfferItem(context: context,);
    }else{
      return buildItem(context: context);  
    }
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
                        widget.itemModel.image),
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
              children:[
                Flexible(
                  fit: FlexFit.tight,
                  flex: 4,
                  child: Text(
                    widget.itemModel.name,
                    style: getBoldStyle(color: Colors.white,fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18,0,0,0),
                  child: Text(
                    '${widget.itemModel.price} LE',
                    style: getBoldStyle(color: Colors.white,fontSize: 20),
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
                    color: Color(widget.itemModel.colorRegion),
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
           Padding(
            padding: const EdgeInsets.fromLTRB(22, 15, 22, 0),
            child: Text(
              widget.itemModel.info,
              style: const TextStyle(
                color: ColorTheme.hintText,
                fontFamily: FontsTheme.fontFamily,
                fontSize: 15,
                height: 1.7,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: ()=> Navigator.pushReplacementNamed(context, checkoutpage,arguments: widget.itemModel),
            child: FormFeilds.buttonFormField(
              title: 'Buy Now',
              colorButton: ColorTheme.primary, 
              fontSize: 15,
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
      
    Object fiterOperatorr;
    if (widget.itemModel.percent! < 10) {
      fiterOperatorr = widget.itemModel.percent.toString().substring(0,1 );
    } else  if(widget.itemModel.price == widget.itemModel.offerPrice ){
      fiterOperatorr = 100 ;
    }else{
      fiterOperatorr = widget.itemModel.percent.toString().substring(0,2);
    }
    // var fiterPercent = widget.itemModel.price == widget.itemModel.offerPrice ? 100 : widget.itemModel.percent.toString().substring(0,2);
    var fiterOfferPrice = widget.itemModel.price == widget.itemModel.offerPrice ? 'free' : "${widget.itemModel.offerPrice} LE";
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
                        widget.itemModel.image),
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
                  text: '${widget.itemModel.price} LE',
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
          CountDownText(
            due: DateTime.parse("${widget.itemModel.dateOffer}"),
            finishedText: "This offer has expired",
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
                      color: Color(widget.itemModel.colorRegion),
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
          const Divider(
            color: ColorTheme.primary,
            thickness: 1,
          ),
          const SizedBox(
            height: 15,
          ),
           Padding(
            padding: const EdgeInsets.fromLTRB(22, 15, 22, 0),
            child: Text(
              widget.itemModel.info,
              style: const TextStyle(
                color: ColorTheme.hintText,
                fontFamily: FontsTheme.fontFamily,
                fontSize: 15,
                height: 1.7,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () => Navigator.pushReplacementNamed(context, checkoutpage,arguments: widget.itemModel),
            child: FormFeilds.buttonFormField(
              title: 'Buy',
              colorButton: ColorTheme.primary,
              colorText: ColorTheme.wight,
              dPadding: false,
              heightButton: 50,
              widthtButton: 250,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}