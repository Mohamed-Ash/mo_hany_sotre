import 'package:flutter/material.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/bloc/criteria/where_criteria.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/user/categories/product/product_widget/product_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class ProductPage extends UserInterface  {
  late ApiDataBloc<ItemModel> itemBloc;
  CategoryModel? categoryModel;

  ProductPage({Key? key,this.categoryModel,}) : super(key: key){
    itemBloc = ApiDataBloc<ItemModel>()..add(
      IndexDataEvent(
        where: WhereCriteria(field: 'category_id', isEqualTo: categoryModel!.id)
    ));
  }
  
  @override
  Widget buildBody(BuildContext context) {
    return ProductWidget(categoriesModel: categoryModel!, itemBloc: itemBloc,);
  }
}