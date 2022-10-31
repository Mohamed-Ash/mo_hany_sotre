import 'package:flutter/material.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/message_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';

class MessagesFormWidget extends StatefulWidget {
  final ApiDataBloc<MessageModel> messageBloc;

  const MessagesFormWidget({Key? key,required this.messageBloc}) : super(key: key);

  @override
  State<MessagesFormWidget> createState() => MessagesFormWidgetState();
}

class MessagesFormWidgetState extends State<MessagesFormWidget> {
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 10, 22, 22),
          child: Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color:  ColorTheme.backroundInput,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FormFeilds.textField(
                controller: messageController, 
                keyboardType: TextInputType.text, 
                hintText: 'write somesing...',

              ),
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.all(15.0),
          height: 61,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35.0),
                    boxShadow: const[
                       BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 5,
                          color: Colors.grey)
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.face , color: Colors.blueAccent,), onPressed: () {}),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Type Something...",
                              hintStyle: TextStyle( color:     Colors.blueAccent),
                              border: InputBorder.none),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.photo_camera ,  color: Colors.blueAccent),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.attach_file ,  color: Colors.blueAccent),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                    color: Colors.blueAccent, shape: BoxShape.circle),
                child: InkWell(
                  child: const Icon(
                    Icons.keyboard_voice,
                    color: Colors.white,
                  ),
                  onLongPress: () {
                  },
                ),
              )
            ],
          ),
        ) ,
        Container(
          padding: MediaQuery.of(context).viewInsets,
          color: Colors.grey[300],
          child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type a message',
                  ),
                ))
        ),
      ],
    );
  }
}