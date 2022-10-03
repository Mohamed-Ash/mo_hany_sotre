import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/shipping/shipping_widget/add_item_shipping_widget.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class AddItemShippingPage extends AdminInterface{
  const AddItemShippingPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppBar(
    title: Text(
      'Dashbord',
      style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
    ),
  );

  @override
  Widget buildBody(BuildContext context) {
    return const AddItemShippingWidget();
  }

}