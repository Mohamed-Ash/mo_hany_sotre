import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';


// ignore: must_be_immutable
class PreviewItemPage extends AdminInterface{
  final  ItemModel itemModel;

  // CollectionReference getAllProductSale = FirebaseFirestore.instance.collection('categories').doc(itemModel.idDoc).collection('shipping');
  
  const PreviewItemPage({super.key,required this.itemModel});

  @override
  Widget buildBody(BuildContext context) {
        Object fiterOperatorr ;

    if (itemModel.percent! < 10) {
      fiterOperatorr = itemModel.percent.toString().substring(0,1 );
    } else if(itemModel.price == itemModel.offerPrice ){
      fiterOperatorr = 100 ;
    }else{
      fiterOperatorr = itemModel.percent.toString().substring(0,2);
    }
    // var fiterPercent = itemModel.price == itemModel.offerPrice ? 100 : itemModel.percent.toString().substring(0,2);
    var fiterOfferPrice = itemModel.price == itemModel.offerPrice ? 'free' : "${itemModel.offerPrice} LE";

    return SingleChildScrollView(
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
          /* Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration:  BoxDecoration(
              // color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage("${itemModel.image}")
              ),
            ),
          ), */
          const SizedBox(
            height: 22  ,
          ),
          const Divider(
            color: ColorTheme.porder,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18,0,18,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name',
                  style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                ),
                Text(
                  itemModel.name,
                  style: getSemiBoldStyle(color: ColorTheme.wight,),  
                ),
              ],
            ),
          ),  
          const Divider(
            color: ColorTheme.porder,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18,0,18,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rrgion ',
                  style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                ),
                Text(
                  itemModel.region,
                  style: getSemiBoldStyle(color: ColorTheme.wight,),  
                ),
              ],
            ),
          ),  
          const Divider(
            color: ColorTheme.porder,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18,0,18,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Platform',
                  style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                ),
                Text(
                  itemModel.platform,
                  style: getSemiBoldStyle(color: ColorTheme.wight,),  
                ),
              ],
            ),
          ),  
          const Divider(
            color: ColorTheme.porder,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18,0,18,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price ',
                  style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                ),
                Text(
                  "${itemModel.price} LE",
                  style: getSemiBoldStyle(color: ColorTheme.wight,),  
                ),
              ],
            ),
          ),  
          const Divider(
            color: ColorTheme.porder,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18,0,18,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Offer Price ',
                  style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                ),
                Text(
                  fiterOfferPrice,
                  style: getSemiBoldStyle(color: ColorTheme.wight,),  
                ),
              ],
            ),
          ),  
          const Divider(
            color: ColorTheme.porder,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18,0,18,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Percent',
                  style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                ),
                Text(
                  "$fiterOperatorr %",
                  style: getSemiBoldStyle(color: ColorTheme.wight,),  
                ),
              ],
            ),
          ),  
          const Divider(
            color: ColorTheme.porder,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18,0,18,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date',
                  style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                ),
                CountDownText(
                  due: DateTime.parse("${itemModel.dateOffer}"),
                  finishedText: "This offer has expired",
                  showLabel: true,
                  longDateName: true,
                  daysTextLong: " days ",
                  hoursTextLong: " hours ",
                  minutesTextLong: " mins ",
                  secondsTextLong: " secs ",
                  style: getBoldStyle(color: ColorTheme.wight,fontSize: 14),
                ),
              ],
            ),
          ),  
          const Divider(
            color: ColorTheme.porder,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18,0,18,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Creatged at ',
                  style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                ),
                Text(
                  '${itemModel.createdAt}',
                  style: getSemiBoldStyle(color: ColorTheme.wight,),  
                ),
              ],
            ),
          ),  
          const Divider(
            color: ColorTheme.porder,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18,0,18,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Updated At ',
                  style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                ),
                Text(
                  '${itemModel.updatedAt}',
                  style: getSemiBoldStyle(color: ColorTheme.wight,),  
                ),
              ],
            ),
          ),  
          const Divider(
            color: ColorTheme.porder,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}