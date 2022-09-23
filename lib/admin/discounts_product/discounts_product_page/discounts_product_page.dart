import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/discounts_product/discounts_product_widget/discounts_product_widget.dart';

// ignore: must_be_immutable
class DiscountsProductPage extends AdminInterface{
  const DiscountsProductPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const DiscountsProductWidget();
  }
}