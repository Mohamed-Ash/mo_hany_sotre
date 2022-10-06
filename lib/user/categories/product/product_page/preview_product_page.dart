import 'package:flutter/material.dart';
import 'package:m_hany_store/core/model/shipping_model.dart';
import 'package:m_hany_store/user/categories/product/product_widget/preview_product_widget.dart';

import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class PreviewProductPage extends UserInterface{
  ShippingModel? shippingModel;
   PreviewProductPage({super.key,this.shippingModel});

  @override
  Widget buildBody(BuildContext context) {
    return  PreviewProductWidget(shippingModel: shippingModel!,);
  }
} 