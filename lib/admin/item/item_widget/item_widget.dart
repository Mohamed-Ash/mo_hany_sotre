// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/admin/item/item_page/add_item_page.dart';
import 'package:m_hany_store/admin/item/item_page/edit_item_item_page.dart';
import 'package:m_hany_store/admin/item/item_page/preview_item_page.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';


class ShippingWidget extends StatefulWidget {
  final CategoryModel categoriesModel;
  final ApiDataBloc<ItemModel> itemBloc;

  const ShippingWidget({
    Key? key, 
    required this.categoriesModel,
    required this.itemBloc,
    }) : super(key: key);

  @override
  State<ShippingWidget> createState() => _ShippingWidgetState();
}
 
class _ShippingWidgetState extends State<ShippingWidget> {
 /*  @override
  void initState() {
    super.initState();
    test();
  }
 */
  

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 22, 12, 22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocBuilder(
            bloc: widget.itemBloc,
            builder: (context, state) {
              if(state is DataLoadedState){ 
                if(state.data == null || state.data.isEmpty ){
                  return Expanded(
                    child: Center(
                      child: Text(
                        'Products page is empty',
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
                        itemBuilder: (context ,index){
                          return buildItemProduct(
                            itemModel: state.data[index],
                            context: context, 
                          );
                        },
                        separatorBuilder: (context ,index) => const SizedBox( height: 10),
                        itemCount: state.data.length
                      ),
                    ),
                  ); 
                }
              }else if(state is DataLoadingState){
                return const Expanded(child: Center(child: CircularProgressIndicator(color: ColorTheme.primary),));
              }else{
                return Expanded(child: Center(child: Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),)));
              }
            } 
          ),
          const SizedBox(height: 22,),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,MaterialPageRoute(
                  builder: (context){
                    // return AddItemShippingPage(categoriesModel: widget.categoriesModel,);
                    return AddItemShippingPage(
                      categoriesModel: widget.categoriesModel,
                    );

                  }
                ),
              );
            },
            child: FormFeilds.buttonFormField(
              title: 'Add new item',
              dPadding: false,
              heightButton: 40,
              fontSize: 13,
              colorButton: ColorTheme.primary
            ),
          ),
        ],
      ),
    );
  }
  
/*   test(){
    if (widget.categoriesModel.id == 2) {
      widget.itemBloc.add(DeleteDataEvent(id: widget.categoriesModel.id, files: const ['image']));
      print('deeeleeet');
      print('==========');
    }else{

    }
  } */
  
  Widget buildItemProduct({
    required BuildContext context,
    required ItemModel itemModel,
  }){
    return Container(
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
                child: itemModel.image.isNotEmpty? FadeInImage.assetNetwork(
                  placeholder: 'assets/icons/lloading.gif',
                  image: itemModel.image,
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
                itemModel.name,
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
                        return PreviewItemShippingPage(shippingModel: itemModel,);
                      }
                    ),
                  ),
                  icon: FormFeilds.containerImage(assetImage: 'assets/images/eye.png',height: 18,width: 18),
                ),
                IconButton(
                  onPressed: () => Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context){
                        return  EditItemShippingPage(itemModel: itemModel,categoriesModel: widget.categoriesModel,);
                      }
                    ),
                  ),
                  icon: FormFeilds.containerImage(assetImage: 'assets/images/edit.png',height: 18,width: 18),
                ),
                IconButton(
                  onPressed: (){
                   /*  FormFeilds.deleteMessage(
                      context, 
                      'Are you sure to delete?',
                      InkWell(
                        onTap: () async {
                          widget.shippingRepository.deleteShippingByCategory(
                            collectionIdDoc:widget.categoriesModel.idDoc,
                            idDoc: shipping.idDoc,
                            type: widget.categoriesModel.type,
                            refFromURL: shipping.image
                          );
                          widget.shippingRepository.deleteSearchByCategory(idDoc:  shipping.idDoc,);
                          Navigator.of(context).pop();
                        },
                        child: FormFeilds.buttonFormField(title: 'delete',colorButton: ColorTheme.primary),
                      ),
                    ); */
                    FormFeilds.deleteMessage(
                        context, 
                        'Are you sure to delete?',
                        InkWell(
                        onTap: () async {
                           Navigator.of(context).pushReplacementNamed(shippingPage, arguments: widget.categoriesModel);
                          widget.itemBloc.add(DeleteDataEvent(id: itemModel.id, files: const ['image']));
                          // Navigator.push(context, MaterialPageRoute(builder: (_)=> ShippingPage(categoriesModel: widget.categoriesModel,)));
                        },
                        child: FormFeilds.buttonFormField(title: 'delete',colorButton: ColorTheme.primary),
                      ),
                              // Navigator.push(context, MaterialPageRoute(builder: (_)=> ShippingPage(categoriesModel: widget.categoriesModel,)));
                      );
                  }, 
                  icon: FormFeilds.containerImage(assetImage: 'assets/images/delete.png',height: 18,width: 18),
                ),
              ],
            ),
        ],
      ),
    );
  }
}