import 'package:flutter/material.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/user_model.dart';
import 'package:m_hany_store/user/home/home_widget/home_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class HomePage extends UserInterface{
  late ApiDataBloc<CategoryModel> categoryBloc;
  late ApiDataBloc<UserModel> userModel ;
  // CategoryModel? categoryModel;
  
  HomePage({super.key}){
    categoryBloc = ApiDataBloc<CategoryModel>()..add(const IndexDataEvent());
    userModel    = ApiDataBloc<UserModel>()..add(const IndexDataEvent());
  }

  @override
  Widget buildBody(BuildContext context) {
    return HomeWidget(categoryBloc: categoryBloc, userModel: userModel,);
  }
}