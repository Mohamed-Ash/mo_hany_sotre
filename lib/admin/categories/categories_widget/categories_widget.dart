// ignore_for_file: use_build_context_synchronously, avoid_print, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/admin/categories/categories_page/edit_item_categories_page.dart';
import 'package:m_hany_store/admin/categories/categories_page/preview_item_categories_page.dart';
import 'package:m_hany_store/core/bloc/categories_bloc/categories_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
 CollectionReference<Map<String, dynamic>> getAllProductSale = FirebaseFirestore.instance.collection('categories');


  // List<DocumentSnapshot> 
  @override
  void initState() {
    // getCategories();
    BlocProvider.of<CategoriesBloc>(context);
    super.initState();
    print(getAllProductSale.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 33, 12, 33),
      child: Column(
        children: [
          const SizedBox(height: 22,),
          BlocConsumer<CategoriesBloc,CategoriesState>(
            listener: (context, state) => getAllProductSale,
            builder: (context, state) {
              if(state is GetCategoriesLoadedState){
                return Expanded(
                  child: ListView.separated(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context ,index) => 
                    buildItemProduct(
                      categoriesModel: state.categoriesModel[index],
                      context: context, 
                      getAllProductSale:  getAllProductSale,
                      id: state.categoriesModel[index].id
                      // id: state.categoriesModel[index].id
                    ),
                    separatorBuilder: (context ,index)=> const Divider(
                      color: ColorTheme.porder,
                      thickness: 1,
                    ),
                    itemCount: state.categoriesModel.length,
                  ),
                );
              }else if(state is CategoriesLoadingState){
                return const Expanded(child: Center(child:  CircularProgressIndicator(),));
              }else if (state  == null ){
                return Expanded(child: Text('categories page is empty Please add a Ctegories',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),));
              }else {
                return  Expanded(child: Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),));
              }
            },
          ),
          const SizedBox(height: 22,),
          InkWell(
            onTap: () => Navigator.pushNamed(context, addItemCategoriesPage),
            child: FormFeilds.buttonFormField(
              title: 'Add  new Categories',
              dPadding: false,
              heightButton: 40,
              colorButton: ColorTheme.primary
            ),
          ),
        ],
      ),
    );
  }
  Widget buildItemProduct({
    required BuildContext context,
    // required int index,
    required  id,
    required CategoriesModel categoriesModel,
    required CollectionReference<Map<String, dynamic>> getAllProductSale
  }){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image:  DecorationImage(
              fit: BoxFit.contain,
                image: NetworkImage("${categoriesModel.image}")
              ),
            ),
          ),
          const SizedBox(width: 18,),
          Flexible(
            // flex: 3,
            child: Text(
              categoriesModel.name,
              style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          // const SizedBox(width: 12,),
          Row(
            children: [ 
              IconButton(
                onPressed: () => Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context){
                      return PreviewItemCategoriesPage(categoriesModel: categoriesModel,);
                    }
                  ),
                ),
                icon: FormFeilds.containerImage(assetImage: 'assets/images/eye.png',height: 18,width: 18),
              ),
              IconButton(
                // onPressed: () => Navigator.pushNamed(context, editItemCategoriesPage,arguments: id),
                // onPressed: (){},
                onPressed: () => Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context){
                      return EditItemCategoriesPage(categoriesModel: categoriesModel,);
                    }
                  ),
                ),
                icon: FormFeilds.containerImage(assetImage: 'assets/images/edit.png',height: 18,width: 18),
              ),
              IconButton(
                onPressed: (){
                  FormFeilds.mesgDelete(

                    context, 
                    'Are you sure to delete?',
                    InkWell(
                      onTap: () async {
                        await FirebaseStorage.instance.refFromURL("${categoriesModel.image}").delete();
                        await getAllProductSale.doc(categoriesModel.idDoc).delete();
                        print(id);
                        // deleteItemCatecories(categoriesModel,);
                        Navigator.of(context).pop();
                      },
                      child: FormFeilds.buttonFormField(title: 'delete',colorButton: ColorTheme.primary),
                    ),
                    // FormFeilds.buttonFormField(title: 'cancel')
                  );

                }, 
                icon: FormFeilds.containerImage(assetImage: 'assets/images/delete.png',height: 18,width: 18),
              ),
            ],
          ),
      ],
    );
  }
  Future deleteItemCatecories(CategoriesModel categoriesModel)async{
      //  .FirebaseFirestore.collection('post_details').doc();
    // var  getIDCollection = FirebaseFirestore.instance.collection('categories').doc();
    try{
      await getAllProductSale.doc(categoriesModel.idDoc).delete().then((value) => print('deleted ==+++'));
      // await FirebaseStorage.instance.refFromURL(categoriesModel.image).delete();
    }catch(e){
      print('[delete Item Catecories method is] [error] [$e]');
    }

  }
 /*  Future<void> getCategories() async {
    QuerySnapshot responseBody  = await getAllProductSale.get();
    for(var element in responseBody.docs){
      setState(() {
        salePRoducts.add(element.data());
      });
        /* salePRoducts.add(element.id);
        print('====================');
        print(salePRoducts); */
    }
  } */

  
 /* Future<void> deleteData(index)async{
    var  postDat = FirebaseFirestore.instance.collection('categories').doc(postDat).delete();
    
    print(postDat);
    print('=========================================');
  }  */
}

/* https://www.mhany-store.com/IMG/HOME/002.jpg
  return Text("${getAllProductSale.doc().id}");
  
 */