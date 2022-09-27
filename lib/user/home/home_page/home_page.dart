import 'package:flutter/material.dart';
import 'package:m_hany_store/user/home/home_widget/home_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

class HomePage extends UserInterface{
  const HomePage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const HomeWidget();
  }
}
          // const ProductWidget(),