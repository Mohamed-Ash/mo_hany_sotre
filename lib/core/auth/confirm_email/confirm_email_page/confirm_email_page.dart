import 'package:flutter/material.dart';
import 'package:m_hany_store/core/auth/confirm_email/confirm_email_widget/confirm_email_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

class ConfirmEmailPage extends UserInterface{
  const ConfirmEmailPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const ConfirmEemailWidget();
  }

}