// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/categories/product/product_page/preview_product_page.dart';

// ignore: must_be_immutable
class ProductWidget extends StatefulWidget {
  final ApiDataBloc<ItemModel> itemBloc;
  final CategoryModel categoriesModel;
  const ProductWidget({
    Key? key,
    required this.categoriesModel,
    required this.itemBloc
  }) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder(
        bloc: widget.itemBloc,
        builder: (context, state) {
          if(state is DataLoadedState){
            if (state.data == null || state.data.isEmpty) {
              return Center(
                child: Text(
                  'This page will be up and running soon',
                  style: getBoldStyle(color: ColorTheme.wight,fontSize: 16),
                ),
              );
            }else{
              return SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: [
                    // const SizedBox(height: 30),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2/3,
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                      ),
                      itemBuilder: (context,index) {
                        return getAllproducts(
                          context: context,
                          itemModel: state.data[index],
                        );
                      } ,
                      itemCount: state.data.length,
                    ),
                  ],
                ),
              );
            }
          }else if(state is DataLoadingState){
            return const Center(child: CircularProgressIndicator(color: ColorTheme.primary));
          }else{
            return Center(child: Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),));  
          }     
        },
      ),
    );
  }

  Widget getAllproducts({
    required BuildContext context,
    required ItemModel itemModel,
   }){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context){
                return PreviewProductPage(itemModel: itemModel,);
              }
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              width: 175,
              height: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorTheme.darkAppBar
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 175,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(8),
                    image:   DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        itemModel.image
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Text(
                    itemModel.name,
                    style: getBoldStyle(color: ColorTheme.wight,fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Text(
                    'Price ${itemModel.price} LE',
                    style: getBoldStyle(color: ColorTheme.wight,fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  fixBixiles(BuildContext context){
    if(MediaQuery.of(context).size.width > 30.0 && MediaQuery.of(context).size.width < 100.0 ) {
      return 130.0;
    }else if (MediaQuery.of(context).size.width < 100.0 && MediaQuery.of(context).size.width > 200.0 ){
      return 150.0;
    }else if (MediaQuery.of(context).size.width < 200.0 && MediaQuery.of(context).size.width > 300.0 ){
      return 160.0;
    }else{
      return 175.0;
    }
  }  
}
