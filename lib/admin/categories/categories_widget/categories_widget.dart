// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';


// ignore: must_be_immutable
class CategoriesWidget extends StatefulWidget {
  final ApiDataBloc<CategoryModel> categoryBloc;

  const CategoriesWidget({
    Key? key,
    required this.categoryBloc,
  }) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 22, 12, 22),
      child: Column(
        children: [
          BlocBuilder(
            bloc: widget.categoryBloc,
            builder: (context, state) {
              if(state is DataLoadedState){
                if(state.data == null || state.data.isEmpty){
                  return Expanded(
                    child: Center(
                      child: Text(
                        'Categories page is empty',
                        style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),
                      ),
                    ),
                  );
                }else{
                  return Expanded(
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context ,index) => buildItemProduct(
                          categoriesModel: state.data[index],
                          context: context,
                        ),
                        separatorBuilder: (context ,index) => const SizedBox( height: 10),
                        itemCount: state.data.length,
                      ),
                    ),
                  );
                }
              }else if(state is DataLoadingState){
                return  const Expanded(child: Center(child: CircularProgressIndicator(color: ColorTheme.primary),));
              }else {
                return Expanded(child: Center(child: Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),)));
              }
            },//
          ),
          const SizedBox(
            height: 22,
          ),
          InkWell(
            onTap: () => Navigator.pushReplacementNamed(context, addItemCategoriesPage),
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
    required CategoryModel categoriesModel,
  }){
    return InkWell(
      onTap: ()=> Navigator.pushReplacementNamed(context, itemPage,arguments:  categoriesModel,),
      borderRadius: BorderRadius.circular(8),//context, itemPage, arguments: categoriesModel
      child: Card(
        color: ColorTheme.porder,
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
                  child: categoriesModel.image!.isNotEmpty? FadeInImage.assetNetwork(
                    placeholder: 'assets/icons/lloading.gif',
                    image: "${categoriesModel.image}",
                    fit: BoxFit.fill,
                    placeholderFit: BoxFit.contain,
                  ) : Image.asset('assets/images/no_image_available.jpg'),
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
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        previewItemCategoriesPage, 
                        arguments: categoriesModel
                      );
                    },
                    icon: FormFeilds.containerImage(assetImage: 'assets/images/eye.png',height: 18,width: 18),
                  ),
                  IconButton(
                    onPressed:  () => Navigator.pushReplacementNamed(context, editItemCategoriesPage ,arguments: categoriesModel),
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
                              Navigator.of(context).pop();
                              widget.categoryBloc.add(DeleteDataEvent(id: categoriesModel.id, files: const ['image']));
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
      ),
    );
  }

  // Future<void> deleteItemCatecories(CategoryModel categoriesModel)async{
  //   try{
  //     await getAllProductSale.doc(categoriesModel.idDoc).delete().then((value) => debugPrint('deleted ==+++'));
  //     await FirebaseStorage.instance.refFromURL("${categoriesModel.image}").delete();
  //   }catch(e){
  //     debugPrint('[delete Item Catecories method is] [error] [$e]');
  //   }
  // }
}