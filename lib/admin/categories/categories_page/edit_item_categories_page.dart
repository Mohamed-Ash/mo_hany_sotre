import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/categories/categories_widget/edit_item_categories_widget.dart';
import 'package:m_hany_store/core/model/category_model.dart';

// ignore: must_be_immutable
class EditItemCategoriesPage extends AdminInterface{
  final CategoriesModel categoriesModel;

  const EditItemCategoriesPage({super.key,required this.categoriesModel});
  
  @override
  Widget buildBody(BuildContext context) {
    return EditItemCategoriesWidget(categoriesModel: categoriesModel,);
  }
}