import 'package:flutter/material.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/user/sale/sale_widget/sale_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class SalePage extends UserInterface{
  late ApiDataBloc<ItemModel> itemBloc;
  ItemModel? itemModel;
  
  SalePage({super.key}) {
    itemBloc = ApiDataBloc<ItemModel>()..add( const IndexDataEvent(),);
  }

  @override
  Widget buildBody(BuildContext context) {
    return SaleWidget(itemBloc: itemBloc,);
  }
}