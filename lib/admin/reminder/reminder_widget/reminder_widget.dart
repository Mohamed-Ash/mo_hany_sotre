// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/notifcation_model.dart';
import 'package:m_hany_store/core/notifcation/notifcation.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';

class ReminderWidget extends StatefulWidget{
  const ReminderWidget({super.key,});

  @override
  State<ReminderWidget> createState() => _ReminderWidgetState();
}

class _ReminderWidgetState extends State<ReminderWidget> {
  final nameController = TextEditingController();

  final bodyController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    firebaseMessagingListener();
  }

   void firebaseMessagingListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      NotifcationModel notificationMessage = NotifcationModel.fromJson(message.data);
      print('notification from foreground : ${notificationMessage.title}');
      print('notification from foreground : ${notificationMessage.body}');
      print('=++++++++++++++++++++++++++++++++++++++++notification from foreground : ${notificationMessage.title}');

    });
  }
  // d2IVQXl2SMS20zo7nelAAK:APA91bFuEQlUX5LlsJBNZuFPVLifLE6psqLLEhvBILGjPv_vR6lmtgXPztXMTXwlqYPf1VSFRnZnbcvQAtAHo-JbwhaVnwAvRYDqjxsh84FXfeyCByhFVGeQCRoChn63Cj2DUmygMO7j

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 10, 22, 22),
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:  ColorTheme.backroundInput,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  FormFeilds.textField(
                    controller: nameController, 
                    keyboardType: TextInputType.text, 
                    hintText: 'Add title',
                    // hintTextColor: dialogPickerColor,
                    validator:(validate){
                      if(validate == null || validate.isEmpty){
                        return 'please add title';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 10, 22, 22),
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:  ColorTheme.backroundInput,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  FormFeilds.textField(
                    controller: bodyController, 
                    keyboardType: TextInputType.text, 
                    hintText: 'Add body',
                    // hintTextColor: dialogPickerColor,
                    validator:(validate){
                      if(validate == null || validate.isEmpty){
                        return 'please add body';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height:33, 
            ),
           InkWell(
              onTap: ()async{
                setReminder();
              },
              child: FormFeilds.buttonFormField(
                widthtButton: double.infinity,
                heightButton: 50,
                title: 'Done',
                colorButton: ColorTheme.primary, 
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            
            /*   BlocBuilder(
              bloc: widget.userBloc,
              builder: (context, state) {
                if (state is DataLoadedState) {
                  return ListView.builder(
                    shrinkWrap: true ,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.data.length,
                    itemBuilder: (BuildContext context, int index){
                      return InkWell(
                        onTap: ()async{
                          setReminder(userModel: state.data[index]);
                        },
                        child: FormFeilds.buttonFormField(
                          widthtButton: double.infinity,
                          heightButton: 50,
                          title: 'Done',
                          colorButton: ColorTheme.primary, 
                        ),
                      );
                    },
                  );
                }else if(state is DataLoadingState){
                  return const CircularProgressIndicator(color: Colors.transparent,);
                }else {
                  return const Text('404');
                }
              } 
            ), */
          ],
        ),
      ),
    );
  }

  setReminder()async{
    if(formKey.currentState!.validate()){
      await NotifcationPage().sendNotification(
        title: nameController.text,
        body: bodyController.text,
      );
    }else{
      return Container();
    }
  }
}