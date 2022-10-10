// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/admin/categories/categories_page/edit_item_categories_page.dart';
import 'package:m_hany_store/admin/categories/categories_page/preview_item_categories_page.dart';
import 'package:m_hany_store/admin/shipping/shipping_page/shipping_page.dart';
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
  CategoriesBloc? categoriesBloc;

  CollectionReference<Map<String, dynamic>> getAllProductSale = FirebaseFirestore.instance.collection('categories');
  @override
  void initState() {
    super.initState();
    categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
  }
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
  }
  @override
  void dispose() {
    categoriesBloc!.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 22, 12, 33),
      child: Column(
        children: [
          BlocConsumer<CategoriesBloc,CategoriesState>(
            bloc:  context.read<CategoriesBloc>(),
            listener: (context, state) {},
            builder: (context, state) {
              if(state is GetCategoriesLoadedState){
                if(state.categoriesModel.isEmpty || state.categoriesModel == null){
                  return Expanded(
                    child: Center(
                      child: Text(
                        'Categories page is empty',
                        style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),
                      ),
                    ),
                  );
                }else{
                  return SizedBox(
                    height: 555,
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context ,index) => buildItemProduct(
                          categoriesModel: state.categoriesModel[index],
                          context: context, 
                          getAllProductSale:  getAllProductSale,
                        ),
                        separatorBuilder: (context ,index) => const SizedBox( height: 10),
                        itemCount: state.categoriesModel.length,
                      ),
                    ),
                  );
                }
              }else if(state is CategoriesLoadingState){
                return  const Expanded(child: Center(child: CircularProgressIndicator(color: ColorTheme.primary),));
              }else if(state is CategoriesErrorState){
                return Expanded(child: Center(child: Text(state.error,style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,))));
              }else {
                return Expanded(child: Center(child: Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),)));
              }
            },//
          ),
          const SizedBox(
            height: 22,
          ),
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
    required CategoriesModel categoriesModel,
    required CollectionReference<Map<String, dynamic>> getAllProductSale
  }){
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context){
              return ShippingPage(categoriesModel: categoriesModel,);
            }
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: const Border(
            bottom: BorderSide(color: ColorTheme.porder,width: 1),
            left: BorderSide(color: ColorTheme.porder,width: 1),
            right: BorderSide(color: ColorTheme.porder,width: 1),
            top: BorderSide(color: ColorTheme.porder,width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 75,
              height: 75,
              child: PhysicalModel(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.black,
                shape: BoxShape.rectangle,  
                borderRadius: BorderRadius.circular(8),
                child:FadeInImage.assetNetwork(
                  placeholder: 'assets/icons/lloading.gif',
                  image: "${categoriesModel.image}",
                  fit: BoxFit.fill,
                  placeholderFit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 18,),
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: Text(
                categoriesModel.name,
                style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 13,),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
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
                    setState(() {  
                      FormFeilds.deleteMessage(
                        context, 
                        'Are you sure to delete?',
                        InkWell(
                          onTap: () async {
                            deleteItemCatecories(categoriesModel,).then((value) {
                              Navigator.pushNamedAndRemoveUntil(context, categoriesPage, (route) => false);
                            });
                          },
                          child: FormFeilds.buttonFormField(title: 'delete',colorButton: ColorTheme.primary),
                        ),
                      );
                    });
                  }, 
                  icon: FormFeilds.containerImage(assetImage: 'assets/images/delete.png',height: 18,width: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteItemCatecories(CategoriesModel categoriesModel)async{
    try{
      await getAllProductSale.doc(categoriesModel.idDoc).delete().then((value) => debugPrint('deleted ==+++'));
      await FirebaseStorage.instance.refFromURL("${categoriesModel.image}").delete();
    }catch(e){
      debugPrint('[delete Item Catecories method is] [error] [$e]');
    }
  }
}