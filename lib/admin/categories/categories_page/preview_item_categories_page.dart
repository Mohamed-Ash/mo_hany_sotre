import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class PreviewItemCategoriesPage extends AdminInterface{
  final  CategoryModel categoriesModel;

/*   final String id;
  final DocumentSnapshot categories; */

  const PreviewItemCategoriesPage({super.key,required this.categoriesModel});

   @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         /*  const SizedBox(
            height: 33,
          ),
          IconButton(
            onPressed: () => Navigator.pop(context), 
            icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
          ), */
          Stack(
            alignment: Alignment.topLeft,
            children: [
              InkWell(
                onTap: (){
                  openImagesPage(Navigator.of(context),
                    imgUrls: ["${categoriesModel.image}"],
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
                        "${categoriesModel.image}"
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
                  categoriesModel.name,
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
                  '${categoriesModel.createdAt}',
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
                  categoriesModel.updatedAt ?? "-:-:-",
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
                  'type ',
                  style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                ),
                Text(
                  categoriesModel.type,
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

  /* Widget getData(BuildContext context){
    return Column(
      children: [
       /*  Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          /* decoration:  BoxDecoration(
            // color: Colors.white,
            // borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage("${categoriesModel.image}")
            ),
          ), */
          child: 
        ), */
        SizedBox(
            width:  MediaQuery.of(context).size.width,
            height: 400, 
            child: PhysicalModel(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.black,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              child: categoriesModel.image!.isNotEmpty? FadeInImage.assetNetwork(
                placeholder: 'assets/icons/lloading.gif',
                image: '${categoriesModel.image}',
                fit: BoxFit.fill,
                placeholderFit: BoxFit.contain,
              ) : Image.asset('assets/images/no_image_available.jpg'),
            ),
          ),
        /* SizedBox(
          width:  MediaQuery.of(context).size.width,
          height: 400, 
          child: PhysicalModel(
            clipBehavior: Clip.hardEdge,
            color: Colors.black,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            child:categoriesModel.image!.isNotEmpty? FadeInImage.assetNetwork(
              placeholder: 'assets/icons/lloading.gif',
              image: '${categoriesModel.image}',
              fit: BoxFit.fill,
              placeholderFit: BoxFit.contain,
            ) : Image.asset('assets/images/no_image_available.jpg'),
          ), */
        // ),
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
                categoriesModel.name,
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
                '${categoriesModel.createdAt}',
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
                categoriesModel.updatedAt ?? "-:-:-",
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
                'type ',
                style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
              ),
              Text(
                categoriesModel.type,
                style: getSemiBoldStyle(color: ColorTheme.wight,),  
              ),
            ],
          ),
        ),  
      ],
    );
  } */
}