/* import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/model/message_model.dart';

class BuildItemImage extends StatefulWidget {
  final String imageFile;
  final  ApiDataBloc<MessageModel> messageBloc;
  
  const BuildItemImage({Key? key, required this.imageFile, required this.messageBloc}) : super(key: key);

  @override
  State<BuildItemImage> createState() => _BuildItemImageState();
}

class _BuildItemImageState extends State<BuildItemImage> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'image_picker_example_picked_image',
      child: InkWell(
        onTap: () {
          openImagesPage(
            Navigator.of(context),
            imgUrls:[widget.imageFile],
            imgOriginalUrls: [widget.imageFile],
            index: 0,
          );
        },
        child: Image.file(
          File(widget.imageFile)
        ),
      ),
    );
  }
  /*  static dynamic sendMessage(context)async{
    FormFeilds.showLoading(context);
     var file = File( widget.imageFile);
    String id = await NextIdHelper.getNextId('messages');
    MessageModel data = MessageModel(
      text:  messageController.text, 
      timeNow: timeTest,
      image: ,
      dateMessage: '$dateMessage',
      id: id,
    );
    widget.messageBloc.add(StoreMessageDataEvent(data:data.toJson()));
    setState(() {
      messageController.clear();
      // messageController.dispose();
    });
    Navigator.pop(context);
  } */
} */