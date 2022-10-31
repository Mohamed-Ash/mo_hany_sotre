// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/helper/next_id_helper.dart';
import 'package:m_hany_store/core/model/message_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

// ignore: must_be_immutable
class MessagesWidget extends StatefulWidget {
  late  ApiDataBloc<MessageModel> messageBloc;
  
  MessagesWidget({Key? key,required this.messageBloc}) : super(key: key);

  @override
  State<MessagesWidget> createState() => TtopicWidgetState();
}

class TtopicWidgetState extends State<MessagesWidget> {
  double  sizedMessage = 80;
  final messageController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          BlocBuilder(
            bloc: widget.messageBloc,
            builder: (context, state) {
              if(state is DataLoadedState){
                if(state.data == null || state.data.isEmpty){
                  return Expanded(
                    child: Center(
                      child: Text(
                        'Topics page is empty',
                        style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),
                      ),
                    ),
                  );
                }else{
                  return Expanded(
                    child: SingleChildScrollView(
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
                }
              }else if(state is DataLoadingState){
                return  const Expanded(child: Center(child: CircularProgressIndicator(color: ColorTheme.primary),));
              }else {
                return Expanded(child: Center(child: Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),)));
              }
            },//
          ),
          /* 'In this section you can find all of FIFA\'s'
            'official documents downloadable in PDF format.'
            'From archived financial reports to published'
            'circulars, on subjects as diverse at the Laws'
            ' of the Game, the regulations of each and every'
            'FIFA tournament, technical reports or even security'
            'regulations, this collection of PDFs available online'
            'via FIFA.com has been collated and organised to help you'
            'find exactly the documents you are looking for.', */
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 10, 10, 22),
            child: Row(
              children: [
                 Expanded(
                  child: Container(
                    width: double.infinity,
                    height: sizedMessage < 90 ? sizedMessage : 200,
                    decoration: BoxDecoration(
                      color:  ColorTheme.backroundInput,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FormFeilds.textField(
                      controller: messageController, 
                      keyboardType: TextInputType.multiline, 
                      hintText: 'write somesing...',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                 GestureDetector(
                  onTap: () {
                    sendMessage(context);
                  },
                  child: FormFeilds.containerImage(assetImage:'assets/icons/send_message.png',height: 30,width: 30)
                ),
              ],
            ),
          ),       
        ],
      ),
    );
  }

  Widget getDataMessage({
    required MessageModel messageModel,
  }){
    return Dismissible(
      key: ObjectKey(messageModel),
      onDismissed: (direction) {
        setState(() {
          widget.messageBloc.add(DeleteMessageDataEvent(id: messageModel.id));
        });
      },
      child: Column(
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorTheme.darkAppBar
            ),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: SelectableText(
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
      ),
    );
  }

  sendMessage(context)async{
    if(messageController !=null || messageController.text.isEmpty){
      String timeTest  =  DateFormat.jm().format( DateTime.now());
      FormFeilds.showLoading(context);
      String id = await NextIdHelper.getNextId('messages');
      MessageModel data = MessageModel(
        text:  messageController.text, 
        timeNow: timeTest,
        id: id,
      );
      widget.messageBloc.add(StoreMessageDataEvent(data:data.toJson()));
      setState(() {
        messageController.clear();
        // messageController.dispose();
      });
      Navigator.pop(context);
    }else{
      FormFeilds.showMyDialog(
        context: context, 
        message: 'please choose image', 
        actions: <Widget>[
          TextButton(
            onPressed: ()=>Navigator.of(context).pop(), 
            child: Text(
              'Okay',
              style: getBoldStyle(color: ColorTheme.wight,
              )
            ),
          ),
        ]
      );
    }
  }
}