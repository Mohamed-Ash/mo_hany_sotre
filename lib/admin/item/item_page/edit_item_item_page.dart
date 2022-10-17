import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/item/item_widget/edit_item_widget.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';

// ignore: must_be_immutable
class EditItemShippingPage extends AdminInterface{
  late ApiDataBloc<ItemModel> itemBloc;
  final ItemModel itemModel;
  final CategoryModel categoriesModel;

   EditItemShippingPage({super.key,required this.itemModel,required this.categoriesModel}){
    itemBloc = ApiDataBloc<ItemModel>();
   }

  @override
  Widget buildBody(BuildContext context) {
    return EditItemShippingWidget(
      categoriesModel: categoriesModel,
      categoryBloc: itemBloc, 
      itemModel: itemModel,
    );
  }
} 