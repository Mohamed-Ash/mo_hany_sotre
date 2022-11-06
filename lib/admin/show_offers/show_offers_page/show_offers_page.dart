import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/show_offers/show_offers_widget/show_offers_widget.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/bloc/criteria/where_criteria.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class ShowOffersPage extends AdminInterface{
  final CategoryModel? categoriesModel;
  late ApiDataBloc<ItemModel> itemModel;
  late ApiDataBloc<CategoryModel> categoryModel;
  
  ShowOffersPage({super.key,this.categoriesModel}){
    itemModel = ApiDataBloc<ItemModel>()..add(
      IndexDataEvent(
        where:  WhereCriteria(field: 'is_offer' ,isEqualTo: true),
      ),
    );
    categoryModel = ApiDataBloc<CategoryModel>()..add(const IndexDataEvent());
  }

    @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pushReplacementNamed(context, adminHome,),
      icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    ),
    title: Text(
      'Products',
      style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
    ),
  );
  @override
  Widget buildBody(BuildContext context) {
    return ShowOffersWidget(itemModel: itemModel,categoriesModel: categoryModel,);
  }

}