import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/categories/categories_widget/categories_widget.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';


// ignore: must_be_immutable
class CategoriePage extends AdminInterface{
  ItemModel? itemModel;
  late ApiDataBloc<CategoryModel> categoryBloc;
  
  CategoriePage({super.key}) {
    categoryBloc = ApiDataBloc<CategoryModel>()..add(
      const IndexDataEvent(
        // where: WhereCriteria(field: 'id',isEqualTo:  itemModel!.categoryId)
    ));
  }
  
  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pushReplacementNamed(context, adminHome),
      icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    ),
    title: Text(
      'Categories',
      style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
    ),
  );

  @override
  Widget buildBody(BuildContext context){
    return CategoriesWidget(
      categoryBloc: categoryBloc,
    );
  }
}