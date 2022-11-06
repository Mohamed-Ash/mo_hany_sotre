import 'package:flutter/material.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/bloc/criteria/where_criteria.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/user/offer/offer_widget/offer_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class OfferPage extends UserInterface{
  late ApiDataBloc<ItemModel> itemBloc;
  ItemModel? itemModel;
  
  OfferPage({super.key}) {
    itemBloc = ApiDataBloc<ItemModel>()..add( 
     IndexDataEvent(
        where: WhereCriteria(field: 'is_offer' ,isEqualTo: true),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return OfferWidget(itemBloc: itemBloc,);
  }
}