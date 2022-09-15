import 'package:flutter/material.dart';
import 'package:m_hany_store/user/product/product_page/preview_product_widget.dart';

import 'package:m_hany_store/user/user_interface.dart';

class PreviewProductPage extends UserInterface{
  const PreviewProductPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return  PreviewProductWidget();
  }
} 