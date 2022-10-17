import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/item/item_widget/add_item_widget.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class AddItemShippingPage extends AdminInterface{
  late ApiDataBloc<CategoryModel> categoryBloc;
  late ApiDataBloc<ItemModel> itemBloc;
  
  final CategoryModel? categoriesModel;

  AddItemShippingPage({super.key, this.categoriesModel}){
    categoryBloc = ApiDataBloc<CategoryModel>();
    itemBloc = ApiDataBloc<ItemModel>();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
    title: Text(
      'Dashbord',
      style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
    ),
  );

  @override
  Widget buildBody(BuildContext context) {
    return  AddItemShippingWidget(
      categoriesModel: categoriesModel!,
      itemBloc: itemBloc,
    );
  }

}