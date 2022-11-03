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
                  'Price ',
                  style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                ),
                Text(
                  "${itemModel.price}",
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
                image: itemModel.image,
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
                  '${itemModel.region}',
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