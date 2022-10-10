// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/admin/shipping/shipping_page/add_item_shipping_page.dart';
import 'package:m_hany_store/admin/shipping/shipping_page/edit_item_shipping_page.dart';
import 'package:m_hany_store/admin/shipping/shipping_page/preview_item_shipping_page.dart';
import 'package:m_hany_store/core/bloc/shipping_bloc/shipping_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/shipping_model.dart';
import 'package:m_hany_store/core/repositories/admin/shipping_repository.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class ShippingWidget extends StatefulWidget {
  final CategoriesModel categoriesModel;
  final ShippingRepository shippingRepository;
  

  const ShippingWidget({Key? key, required this.categoriesModel,required this.shippingRepository}) : super(key: key);

  @override
  State<ShippingWidget> createState() => _ShippingWidgetState();
}
 
class _ShippingWidgetState extends State<ShippingWidget> {
  ShippingBloc? shippingBloc;

  @override
  void initState() {
    super.initState();
   shippingBloc = BlocProvider.of<ShippingBloc>(context);
  }
  
  @override
  void dispose() {
    shippingBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 22, 12, 33),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocBuilder<ShippingBloc,ShippingState>(
            builder: (context, state) {
              if(state is ShippingLoadedState){ 
                if(state.shippingModel.isEmpty || state.shippingModel == null){
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
                    height: 600,
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context ,index){
                          return buildItemProduct(
                            shipping: state.shippingModel[index],
                            context: context, 
                            categoriesModel: widget.categoriesModel
                          );
                        },
                        separatorBuilder: (context ,index) => const SizedBox( height: 10),
                        itemCount: state.shippingModel.length
                      ),
                    ),
                  ); 
                }
              }else if(state is ShippingLoadingState){
                return const Expanded(child: Center(child:  CircularProgressIndicator(color: ColorTheme.primary),));
              }else if(state is ShippingErrorState){
                return Text(state.error,style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,));
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
                    return AddItemShippingPage(categoriesModel: widget.categoriesModel,);
                  }
                ),
              );
            },
            child: FormFeilds.buttonFormField(
              title: 'Add new  ${widget.categoriesModel.type}',
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

 Widget buildItemProduct({
    required BuildContext context,
    required ShippingModel shipping,
    required CategoriesModel categoriesModel,
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
                child:FadeInImage.assetNetwork(
                  placeholder: 'assets/icons/lloading.gif',
                  image: shipping.image,
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
                shipping.name,
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
                        return PreviewItemShippingPage(shippingModel: shipping,);
                      }
                    ),
                  ),
                  icon: FormFeilds.containerImage(assetImage: 'assets/images/eye.png',height: 18,width: 18),
                ),
                IconButton(
                  onPressed: () => Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context){
                        return  EditItemShippingPage(shippingModel: shipping, categoriesModel: widget.categoriesModel,);
                      }
                    ),
                  ),
                  icon: FormFeilds.containerImage(assetImage: 'assets/images/edit.png',height: 18,width: 18),
                ),
                IconButton(
                  onPressed: (){
                    FormFeilds.deleteMessage(
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