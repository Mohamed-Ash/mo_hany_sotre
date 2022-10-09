import 'package:flutter/material.dart';
import 'package:m_hany_store/core/search/search_widget/search_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

class SearchPage extends UserInterface{
  const SearchPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const SearchWidget();
  }
}

