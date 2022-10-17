import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/item/item_widget/item_widget.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/bloc/criteria/where_criteria.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class ShippingPage extends AdminInterface{
  final CategoryModel? categoriesModel;
  late ApiDataBloc<ItemModel> itemBloc;

   ShippingPage({super.key, this.categoriesModel}){
    itemBloc = ApiDataBloc<ItemModel>()..add(
      IndexDataEvent(
        where: WhereCriteria(field: 'category_id', isEqualTo: categoriesModel!.id)
      ),
    );
   }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pushNamedAndRemoveUntil(context, categoriesPage, (route) => false),
      icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    ),
    title: Text(
      'Products',
      style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
    ),
  );

  @override
  Widget buildBody(BuildContext context) {
    return  ShippingWidget(itemBloc: itemBloc, categoriesModel: categoriesModel!,);
  }
}