import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/core/model/shipping_model.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

import '../../../core/theme/colors/color_theme.dart';

// ignore: must_be_immutable
class PreviewItemShippingPage extends AdminInterface{
  final  ShippingModel shippingModel;

  // CollectionReference getAllProductSale = FirebaseFirestore.instance.collection('categories').doc(shippingModel.idDoc).collection('shipping');
  
  const PreviewItemShippingPage({super.key,required this.shippingModel});

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 33,),
          SizedBox(
            width:  MediaQuery.of(context).size.width,
            height: 400, 
            child: PhysicalModel(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.black,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              child:FadeInImage.assetNetwork(
                placeholder: 'assets/icons/lloading.gif',
                image: shippingModel.image,
                fit: BoxFit.fill,
                placeholderFit: BoxFit.contain,
              ),
            ),
          ),
          /* Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration:  BoxDecoration(
              // color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage("${shippingModel.image}")
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
                  shippingModel.name,
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
                  shippingModel.region,
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
                  shippingModel.price,
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
                  shippingModel.platform,
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
                  'Creatged at ',
                  style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                ),
                Text(
                  '${shippingModel.createdAt}',
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
                  '${shippingModel.updatedAt}',
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
   /*  return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context), 
              icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
            ),
            getData(context),
            
          ],
        ),
      ),
    ); */
  }

 /*  Widget getData(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width:  MediaQuery.of(context).size.width,
            height: 400, 
            child: PhysicalModel(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.black,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              child:FadeInImage.assetNetwork(
                placeholder: 'assets/icons/lloading.gif',
                image: shippingModel.image,
                fit: BoxFit.fill,
                placeholderFit: BoxFit.contain,
              ),
            ),
          ),
          /* Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration:  BoxDecoration(
              // color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage("${shippingModel.image}")
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
                  shippingModel.name,
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
                  'Creatged at ',
                  style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                ),
                Text(
                  '${shippingModel.createdAt}',
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
                  '${shippingModel.updatedAt}',
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
                  '${shippingModel.region}',
                  style: getSemiBoldStyle(color: ColorTheme.wight,),  
                ),
              ],
            ),
          ),  
        ],
      ),
    );
  } */
}