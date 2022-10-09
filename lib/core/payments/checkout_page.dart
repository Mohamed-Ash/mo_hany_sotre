import 'package:flutter/material.dart';
import 'package:m_hany_store/core/payments/checkout_widget.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

class CheckoutPage extends UserInterface{
  const CheckoutPage({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
    elevation: 0,
    leading: const Text(''),
    title: Text(
      'Checkout',
      style: getBoldStyle(color: Colors.white,fontSize: 22),
    ),
  );
  
  @override
  Widget buildBody(BuildContext context) {
    return const CheckoutWidget();
  }
}