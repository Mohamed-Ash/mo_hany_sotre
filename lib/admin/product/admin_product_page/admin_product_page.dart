import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/product/admin_product_widget/admin_product_widget.dart';

class AdminProductPage extends AdminInterface{
  
  const AdminProductPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const AdminProductWidget();
  }
}