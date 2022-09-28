import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/offers/offers_widget/offers_widget.dart';

class OffersPage extends AdminInterface{
  const OffersPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const OffersWidget();
  }
}