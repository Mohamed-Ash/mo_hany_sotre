import 'package:flutter/cupertino.dart';
import 'package:m_hany_store/core/layout/layout_interface.dart';

abstract class AdminInterface extends LayoutInterface{
  const AdminInterface({super.key});

  @override
  PreferredSizeWidget? get appBar => null;

  @override
  Color? get  backgroundColor => null ;

  @override
  Widget? get buildDrawer => null;

}