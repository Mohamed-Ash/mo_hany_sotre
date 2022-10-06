import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/shipping/shipping_widget/edit_item_shipping_widget.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/shipping_model.dart';

// ignore: must_be_immutable
class EditItemShippingPage extends AdminInterface{
  final  ShippingModel shippingModel;
  final  CategoriesModel categoriesModel;

  const EditItemShippingPage({super.key,required this.shippingModel, required this.categoriesModel});

  @override
  Widget buildBody(BuildContext context) {
    return EditItemShippingWidget(shippingModel: shippingModel,categoriesModel: categoriesModel,);
  }
} 