import 'package:flutter/cupertino.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/categories/categories_widget/categories_widget.dart';

class CategoriePage extends AdminInterface{
  const CategoriePage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const CategoriesWidget();
  }
}