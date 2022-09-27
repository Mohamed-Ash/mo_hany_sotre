import 'package:m_hany_store/admin/categories/categories_widget/add_item_categories_widget.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:flutter/material.dart';

class AddItemCategoriesPage extends AdminInterface{
  const AddItemCategoriesPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const AddItemCategoriesWidget();
  }
}