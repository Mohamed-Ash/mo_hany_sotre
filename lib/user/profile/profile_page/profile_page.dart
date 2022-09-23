import 'package:flutter/material.dart';
import 'package:m_hany_store/user/profile/profile_widget/profile_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

class ProfilePage extends UserInterface{
  const ProfilePage({super.key});



  @override
  Widget buildBody(BuildContext context) {
    return const ProfileWidget();
  }
}