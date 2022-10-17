import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/category_model.dart';

import '../categories_widget/category_form_widget.dart';

// ignore: must_be_immutable
class AddItemCategoriesPage extends AdminInterface{

  late ApiDataBloc<CategoryModel> categoryBloc;

  AddItemCategoriesPage({super.key}) {
    categoryBloc = ApiDataBloc<CategoryModel>();
  }

  @override
  Widget buildBody(BuildContext context) {
    return CategoryFormWidget(categoryBloc: categoryBloc,);
  }
}