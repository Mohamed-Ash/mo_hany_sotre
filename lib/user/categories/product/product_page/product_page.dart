import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/shipping_bloc/shipping_bloc.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/repositories/admin/shipping_repository.dart';
import 'package:m_hany_store/user/categories/product/product_widget/product_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class ProductPage extends UserInterface  {
  CategoriesModel? categoriesModel;
  ProductPage({Key? key,this.categoriesModel,}) : super(key: key);
  
  @override
  Widget buildBody(BuildContext context) {
    return BlocProvider(
      create: (context)=> ShippingBloc(shippingRepository: ShippingRepository(), categoriesModel: categoriesModel!)..add(GetShippingLoadedEvent()),
      child:  ProductWidget(categoriesModel: categoriesModel!),
    );
  }
}