import 'package:flutter/material.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/checkout/checkout_widget.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class CheckoutPage extends UserInterface{
  final ItemModel itemModel;
  late ApiDataBloc<ItemModel> itemBloc; 
   CheckoutPage({super.key,required this.itemModel}){
    itemBloc = ApiDataBloc<ItemModel>();
  }

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
    return  CheckoutWidget(itemModel: itemModel,itemBloc: itemBloc,);
  }
}