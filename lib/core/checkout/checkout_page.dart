import 'package:flutter/material.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/checkout/checkout_widget.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

class CheckoutPage extends UserInterface{
  final ItemModel itemModel;
  const CheckoutPage({super.key,required this.itemModel});

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    ),
    title: Text(
      'Checkout',
      style: getBoldStyle(color: Colors.white,fontSize: 22),
    ),
  );
  
  @override
  Widget buildBody(BuildContext context) {
    return  CheckoutWidget(itemModel: itemModel,);
  }
}