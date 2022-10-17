import 'package:flutter/material.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/user/categories/product/product_widget/preview_product_widget.dart';

import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class PreviewProductPage extends UserInterface{
   late ApiDataBloc<ItemModel> itemBloc; 
    ItemModel? itemModel;

   PreviewProductPage({super.key,this.itemModel}){
    itemBloc = ApiDataBloc<ItemModel>()..add(const IndexDataEvent());
   }

  @override
  Widget buildBody(BuildContext context) {
    return  PreviewProductWidget(itemModel: itemModel!,);
  }
} 