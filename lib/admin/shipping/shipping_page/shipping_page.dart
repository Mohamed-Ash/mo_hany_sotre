import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/shipping/shipping_widget/shipping_widget.dart';
import 'package:m_hany_store/core/bloc/shipping_bloc/shipping_bloc.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/repositories/admin/shipping_repository.dart';

class ShippingPage extends AdminInterface{
  CategoriesModel? categoriesModel;
  ShippingPage({super.key, this.categoriesModel});

  @override
  Widget buildBody(BuildContext context) {
    return  BlocProvider(
      lazy: false,
      create: (context) => ShippingBloc(shippingRepository: ShippingRepository(),categoriesModel: categoriesModel!)..add(GetShippingLoadedEvent()),
      child: ShippingWidget(categoriesModel: categoriesModel!,shippingRepository: ShippingRepository()),
    );
  }
}