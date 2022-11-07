import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/message_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class TopicWidget extends StatefulWidget {
  final ApiDataBloc<MessageModel> itemBloc;
  
  const TopicWidget({Key? key, required this.itemBloc}) : super(key: key);

  @override
  State<TopicWidget> createState() => NnotificationWidgetState();
}

class NnotificationWidgetState extends State<TopicWidget> {
  var timeTest  =  DateFormat.jm().format( DateTime.now());
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
      child: Column(
        children: [
          BlocBuilder(
            bloc: widget.itemBloc,
            builder: (context, state) {
              if (state is DataLoadedState) {
                return Expanded(
                  child: SingleChildScrollView(
                    reverse: true,
                    physics: const ScrollPhysics(),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context ,index) => getDataMessage(messageModel: state.data[index]),
                      separatorBuilder: (context ,index) => const SizedBox(
                          height: 50,
                        ),
                      itemCount: state.data.length,
                    ),
                  ),
                );
              } else if(state is DataLoadingState){
                return  const Expanded(child: Center(child: CircularProgressIndicator(color: ColorTheme.primary)));
              }else{
                return Center(child: Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),));  
              }     
            },
          ),
        ],
      ),
    );
  }

  Widget getDataMessage({
    required MessageModel messageModel,
  }){
    return Column(
      children: [
        Text(   
          messageModel.timeNow,
          style: getMediumStyle(color: ColorTheme.wight, fontSize: 15),
        ),
        const SizedBox( 
          height: 25,
        ) ,
        Container(
          width: double.infinity,
          // height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorTheme.darkAppBar
          ),
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              messageModel.text,
              style: const TextStyle(
                color: ColorTheme.wight,
                fontFamily: FontsTheme.fontFamily,
                fontSize: 15,
                height: 1.7,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}