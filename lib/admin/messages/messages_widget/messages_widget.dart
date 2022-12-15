// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/helper/next_id_helper.dart';
import 'package:m_hany_store/core/model/message_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:path/path.dart';

// ignore: must_be_immutable
class MessagesWidget extends StatefulWidget {
  late  ApiDataBloc<MessageModel> messageBloc;
  
  MessagesWidget({Key? key,required this.messageBloc}) : super(key: key);

  @override
  State<MessagesWidget> createState() => TtopicWidgetState();
}

class TtopicWidgetState extends State<MessagesWidget> {
  XFile? imageFile; 
  final ImagePicker _imagePicker = ImagePicker();
  String timeTest  =  DateFormat.jm().format( DateTime.now());
  DateTime dateMessage = DateTime.now();

  final formKey = GlobalKey<FormState>();
  final messageController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
  EdgeInsets sizedMessage  = MediaQuery.of(context).viewInsets;
    return Form(
      key: formKey,
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
                      reverse: true,
                      physics: const ScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                    ),
                  );
                }
              }else if(state is DataLoadingState){
                return  const Expanded(child: Center(child: CircularProgressIndicator(color: ColorTheme.primary),));
              }else {
                return Expanded(child: Center(child: Text('error 404',style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14,),)));
              }
            },
          ),
          const SizedBox(
            height: 22,
          ),
          Container(
            color: ColorTheme.darkAppBar,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 22),
              child: Column(
                children: [
                  if(imageFile != null)
                    Stack(  
                      alignment: Alignment.topRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                              /*  onTap: (){
                                  openImagesPage(
                                    Navigator.of(context),
                                    imgUrls:[imageFile.],
                                    index: 0,
                                  );
                                }, 
                                Image.file(
                                  width: double.infinity,
                                  height: 100,
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                  File(imageFile)),
                                */
                                /* child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: imageFile!.length,
                                  separatorBuilder: (context, index) => const SizedBox(width: 5),
                                  itemBuilder: (context, index){
                                    return Semantics(
                                      label: 'image_picker_example_picked_image',
                                      child: InkWell(
                                        onTap: () {
                                          openImagesPage(
                                            Navigator.of(context),
                                            imgUrls:[imageFile![index].path],
                                            imgOriginalUrls: [imageFile![index].path],
                                            index: 0,
                                          );
                                        },
                                        child: Image.file(
                                          File(imageFile![index].path)
                                        ),
                                      ),
                                    );
                                  },
                                ), */
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.file(filterQuality: FilterQuality.high ,File(imageFile!.path)),
                                ), 
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                imageFile = null;
                              });
                            },
                            child: FormFeilds.containerImage(assetImage: 'assets/images/cancel.png',height: 15,width: 15),
                          ),
                        ),
                      ],
                    ),
                    /* Container(
                      width: 50,
                      height: 50,
                      child: Image.file(filterQuality: FilterQuality.high ,File(imageFile!.path)),
                    ), */
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () async {
                          XFile? images = await  _imagePicker.pickImage(source: ImageSource.gallery);
                          setState(() {
                            imageFile = images ;
                          });
                        },
                        child: FormFeilds.containerImage(assetImage:'assets/icons/add_image.png',height: 30,width: 30)
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: sizedMessage,
                          width: double.infinity,
                          // height: sizedMessage < 50 ? sizedMessage : 50,
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
                       InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            sendMessage(context);
                          }
                        },
                        child: FormFeilds.containerImage(assetImage:'assets/icons/send_message.png',height: 30,width: 30)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),       
        ],
      ),
    );
  }

  Widget getDataMessage({
    required MessageModel messageModel,
  }){
    if(messageModel.image != null){
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
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorTheme.darkAppBar
              ),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      messageModel.text,
                      style: const TextStyle(
                        color: ColorTheme.wight,
                        fontFamily: FontsTheme.fontFamily,
                        fontSize: 15,
                        height: 1.7,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      // width: 180,
                      // height: 180, 
                      child: PhysicalModel(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.black,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        child:FadeInImage.assetNetwork(
                          placeholder: 'assets/icons/lloading.gif',
                          image: '${messageModel.image}',
                          fit: BoxFit.fill,
                          placeholderFit: BoxFit.contain,
                        ),
                      ),
                    ), 
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }else{
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
          ),
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
    
  }

  Future<void> sendMessage(context)async{
    FormFeilds.showLoading(context);
    try {
      if (imageFile != null) {
        String id = await NextIdHelper.getNextId('messages');
        
      /*  final LostDataResponse response  = await _imagePicker.retrieveLostData();
        
        final  imageFile =  response.files; */
        
        var nameimage = basename(imageFile!.path);
        
        var random = Random().nextInt(1000000);
        
        nameimage = "$random$nameimage";
        var file = File(imageFile!.path);
        var refSorage = FirebaseStorage.instance.ref("Message").child(nameimage); 
        // await refSorage.putFile(imageFile);
        await refSorage.putFile(file); 
        var urlImage =  await refSorage.getDownloadURL();
        MessageModel data = MessageModel(
          text:  messageController.text, 
          timeNow: timeTest,
          image: urlImage,
          dateMessage: '$dateMessage',
          id: id,
        );
        widget.messageBloc.add(StoreMessageDataEvent(data:data.toJson()));
        setState(() {
          messageController.clear();
          // messageController.dispose();
        });
      } else {
        String id = await NextIdHelper.getNextId('messages');
        MessageModel data = MessageModel(
          text:  messageController.text, 
          timeNow: timeTest,
          image: null,
          dateMessage: '$dateMessage',
          id: id,
        );
        widget.messageBloc.add(StoreMessageDataEvent(data:data.toJson()));
        setState(() {
          messageController.clear();
          // messageController.dispose();
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    Navigator.pop(context);
  }
}