import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class OfferItemWidget extends StatefulWidget {
   final ItemModel itemModel;

  const OfferItemWidget({Key? key, required this.itemModel}) : super(key: key);

  @override
  State<OfferItemWidget> createState() => Ooffer_widrItemWState();
}

// ignore: camel_case_types
class Ooffer_widrItemWState extends State<OfferItemWidget> {

  @override
  Widget build(BuildContext context) {
     Object fiterOperatorr ;

    if (widget.itemModel.price == widget.itemModel.offerPrice){
      fiterOperatorr = 100 ;
    } else if(widget.itemModel.percent! < 10){
      fiterOperatorr = widget.itemModel.percent.toString().substring(0,1 );
    }else{
      fiterOperatorr = widget.itemModel.percent.toString().substring(0,2);
    }
    // var fiterPercent = itemModel.price == itemModel.offerPrice ? 100 : itemModel.percent.toString().substring(0,2);
    var fiterOfferPrice = widget.itemModel.price == widget.itemModel.offerPrice ? 'free' : "${widget.itemModel.offerPrice} LE";
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 22, 12, 22),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, previewSalePage,arguments: widget.itemModel),
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
          color: ColorTheme.darkAppBar,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration:const BoxDecoration(
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                width: double.infinity,
                height: 200,
                child: PhysicalModel(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.black,
                  shape: BoxShape.rectangle,  
                  borderRadius: BorderRadius.circular(8),
                  child: widget.itemModel.image.isNotEmpty? FadeInImage.assetNetwork(
                    placeholder: 'assets/icons/lloading.gif',
                    image: widget.itemModel.image,
                    fit: BoxFit.fill,
                    placeholderFit: BoxFit.contain,
                  ) : Image.asset('assets/images/no_image_available.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,5),
                child: Text(
                  widget.itemModel.name,
                  style: getSemiBoldStyle(color: ColorTheme.wight, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,5),
                child: Row(
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
                          ' - $fiterOperatorr %',
                          style: getSemiBoldStyle(color: ColorTheme.wight, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text.rich(
                      TextSpan(
                        text: '${widget.itemModel.price}',
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
                          fontSize: 14
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '$fiterOfferPrice ',
                      style: getBoldStyle(color: ColorTheme.wight,fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,5,0,20),
                child: CountDownText(
                  due: DateTime.parse("${widget.itemModel.dateOffer}"),
                  finishedText: "This offer has expired",
                  showLabel: true,
                  longDateName: true,
                  daysTextLong: " days ",
                  hoursTextLong: " hours ",
                  minutesTextLong: " mins ",
                  secondsTextLong: " secs ",
                  style: getBoldStyle(color: ColorTheme.wight,fontSize: 13 ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}