import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/shipping/shipping_widget/shipping_widget.dart';

class ShippingPage extends AdminInterface{
  const ShippingPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const ShippingWidget();
  }
}