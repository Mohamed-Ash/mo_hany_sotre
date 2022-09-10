import 'package:flutter/material.dart';
import 'package:m_hany_store/user/product/product_page/product_page.dart';
import 'package:m_hany_store/user/user_interface.dart';

class HomePage extends UserInterface{
  const HomePage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const ProductPage();
  }
}