import 'package:flutter/material.dart';
import 'package:m_hany_store/user/product/product_widget/product_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

class ProductPage extends UserInterface {
  const ProductPage({Key? key}) : super(key: key);
  
  @override
  Widget buildBody(BuildContext context) {
    return ProductWidget();
  }
}