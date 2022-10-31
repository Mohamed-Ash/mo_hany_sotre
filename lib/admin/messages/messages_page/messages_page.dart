import 'package:flutter/material.dart';
import 'package:m_hany_store/admin/admin_interface.dart';
import 'package:m_hany_store/admin/messages/messages_widget/messages_widget.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/message_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class MessagesPage extends AdminInterface{
  late ApiDataBloc<MessageModel> messageBloc;

  MessagesPage({super.key}){
    messageBloc= ApiDataBloc<MessageModel>()..add(const StreamDataEvent());
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pushNamed(context, adminHome),
      icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    ),
    title: Text(
      'Topics',
      style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
    ),
  );
  
  @override
  Widget buildBody(BuildContext context) {
    return MessagesWidget(messageBloc: messageBloc,);
  }
}