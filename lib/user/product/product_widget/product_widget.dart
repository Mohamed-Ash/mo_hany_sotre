// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/product/product_widget/product_item_widget.dart';

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
  bool isSelected   = false;
ScrollController controller = ScrollController();

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
              return // const SizedBox(height: 30),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    GridView.builder(
                      // controller: controller,
                      shrinkWrap: true ,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: isSelected == false ? 300 : 400, 
                      ), 
                      itemBuilder: (BuildContext context,int index,) => ProductItemWidget(itemModel: state.data[index],isSelected: isSelected),
                      itemCount: state.data.length,
                      
                    /*   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 410,
                      ), */
                      // itemBuilder: (BuildContext context,int index,) => ProductItemWidget(itemModel: state.data[index],isSelected: isSelected),
                      // itemCount: state.data.length,
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
}
