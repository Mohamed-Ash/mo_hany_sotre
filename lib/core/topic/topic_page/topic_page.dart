import 'package:flutter/material.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/message_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/core/topic/topic_widget/topic_widget.dart';
import 'package:m_hany_store/user/user_interface.dart';

// ignore: must_be_immutable
class TopicPage extends UserInterface{
  late ApiDataBloc<MessageModel> itemBloc;
  
  TopicPage({super.key}){
    itemBloc = ApiDataBloc()..add( const StreamDataEvent());
  }
  
  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pushNamed(context, appPageLayout),
      icon: const Icon(Icons.arrow_back_ios_new_rounded) 
    ),
    title: Text(
      'Topics For offers',
      style: getBoldStyle(color: ColorTheme.wight,fontSize: 22),
    ),
  );

  @override
  Widget buildBody(BuildContext context) {
    return TopicWidget(itemBloc: itemBloc);
  }
  
}