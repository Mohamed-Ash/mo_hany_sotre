import 'package:flutter/material.dart';
import 'package:m_hany_store/core/layout/layout_interface.dart';

 abstract class UserInterface extends LayoutInterface{
  const UserInterface({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Color? get  backgroundColor => null ;

  @override
  Widget? get buildDrawer => null;
  
}