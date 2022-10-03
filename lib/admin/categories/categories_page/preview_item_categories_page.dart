import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class PreviewItemCategoriesPage extends AdminInterface{
  final  CategoriesModel categoriesModel;

  CollectionReference getAllProductSale = FirebaseFirestore.instance.collection('categories');
/*   final String id;
  final DocumentSnapshot categories; */

  PreviewItemCategoriesPage({super.key,required this.categoriesModel});

   @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 33,
            ),
            IconButton(
              onPressed: () => Navigator.pop(context), 
              icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
            ),
            /* StreamBuilder(
              stream: getAllProductSale.snapshots(),
              builder: (context,AsyncSnapshot<QuerySnapshot>  snapshot){
                // List<DocumentSnapshot> docs = snapshot.data!.docs;
                print(categoriesModel.name);
                if(snapshot.hasData) {
                  return getData(context);
                } else if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child:  CircularProgressIndicator(),);
                } else {
                  return const Text('error 404');
                }
              },
            ), */
            getData(context),
            const Divider(
              color: ColorTheme.porder,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget getData(BuildContext context){
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration:  BoxDecoration(
            // color: Colors.white,
            // borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage("${categoriesModel.image}")
            ),
          ),
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
                '2022/9/9 09:30 pm',
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
  }
}