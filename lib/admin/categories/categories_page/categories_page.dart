import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/categories/categories_widget/categories_widget.dart';
import 'package:m_hany_store/core/bloc/categories_bloc/categories_bloc.dart';
import 'package:m_hany_store/core/repositories/admin/categories_ropository.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class CategoriePage extends AdminInterface{
  const CategoriePage({super.key});
  
  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pushNamedAndRemoveUntil(context, appPageLayout, (route) => false),
      icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    ),
    title: Text(
      'Categories',
      style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
    ),
  );

  @override
  Widget buildBody(BuildContext context){
    return  BlocProvider(
      create: (context) => CategoriesBloc(categoriesRpoSitory: CategoriesRpoSitory())..add(GetAllCategoriesEvent()),
      // create: (context) => CategoriesBloc(categoriesRpoSitory: RepositoryProvider.of<CategoriesRpoSitory>(context)),
      child: const CategoriesWidget(),
    );
  }
}