import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/categories_bloc/categories_bloc.dart';
import 'package:m_hany_store/core/repositories/admin/categories_ropository.dart';
import 'package:m_hany_store/user/home/home_widget/home_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

class HomePage extends UserInterface{
  const HomePage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesBloc(categoriesRpoSitory: CategoriesRpoSitory())..add(GetAllCategoriesEvent()),
      child: const HomeWidget(),
    );
  }
}
          // const ProductWidget(),