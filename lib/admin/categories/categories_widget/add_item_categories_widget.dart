// ignore_for_file: avoid_print
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:path/path.dart';

class AddItemCategoriesWidget extends StatefulWidget {
  const AddItemCategoriesWidget({Key? key}) : super(key: key);

  @override
  State<AddItemCategoriesWidget> createState() => _AddItemCategoriesWidgetState();
}

class _AddItemCategoriesWidgetState extends State<AddItemCategoriesWidget> {
  XFile? image;
  DateTime now =  DateTime.now();
  String? selectedValue;

  final ImagePicker _picker = ImagePicker();
  final nameController = TextEditingController();
  final formKye = GlobalKey<FormState>();
  

  final List<String> genderItems = [
    'shipping',
    'offers',
    'products',
  ];
  
  var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

  @override
  void initState() {
    selectedValue = null ; 
    nameController.clear(); 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKye,
        child: Column(
          children: [
            const SizedBox(height: 12,),
            if (image == null)
              InkWell(
                onTap: () async {
                  final imagePiced = await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    image = imagePiced;
                  });     
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 94, 93, 93),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.image,color: ColorTheme.white,
                      size: 66,
                    ), 
                  ],
                ),
              )
            else
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            openImagesPage(
                              Navigator.of(context),
                              imgUrls:[image!.path],
                              index: 0,
                            );
                          },
                          child: Image.file(
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high,
                            File(image!.path)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 10, 22, 22),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:  ColorTheme.backroundInput,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FormFeilds.textField(
                        controller: nameController, 
                        keyboardType: TextInputType.text, 
                        hintText: 'Add Name',
                        validator:(validate){
                          if(validate == null){
                            return 'please add Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                    height: 22,
                    ),
                  ],
                ),
              ),
                CustomDropdownButton2(
                  hint: 'Select Item',
                  
                  iconDisabledColor: ColorTheme.white,
                  iconEnabledColor: ColorTheme.white,
                  dropdownItems: genderItems,
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  image = null;
                });
              },
              label: const Text('Remove Image'),
              icon: const Icon(Icons.close),
            ),
            const SizedBox(
              height: 10,
            ),
           /*  ElevatedButton.icon(
              onPressed: () async{
                if(formKye.currentState!.validate()){
                  await postData(context);
                }
              },
              label: const Text('done'),
              icon: FormFeilds.containerImage(assetImage: 'assets/images/upload.png',height: 30,width: 30),
            ), */
            const SizedBox(
              height:100, 
            ),
            InkWell(
              onTap: ()async{
                if(formKye.currentState!.validate()){
                  await postData(context);
                }
              },
              child: FormFeilds.buttonFormField(
                widthtButton: double.infinity,
                heightButton: 50,
                // dPadding: false,
                title: 'Done',
                colorButton: ColorTheme.primary, 
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
  
  postData(context)async{
    CollectionReference postDat = FirebaseFirestore.instance.collection('categories');
    
    if (image != null){
      FormFeilds.showLoading(context);

      var file = File(image!.path);

      var nameimage = basename(image!.path);

      var random = Random().nextInt(1000000);

      nameimage = "$random$nameimage";

      var refSorage = FirebaseStorage.instance.ref("categories").child(nameimage); 
      print('=========================================');
      print(nameimage);
      await refSorage.putFile(file);

      var uri =  await refSorage.getDownloadURL();

      await postDat.add({
          "images": uri,
          "name": nameController.text,
          "craeted at": formattedDateTime(),
          "type": selectedValue,
        }).then((value) {
          setState(() {
            image = null;
          });
          print('url: $uri');
        });
      Navigator.pop(context);
    }else{
      // Navigator.pop(context);
      FormFeilds.showMyDialog(context, 'please choose image');
    }
   /*  print('=========================================');
    print(nameimage);
    print('=========================================');
    print(postDat);
    print('========================================='); */
  } 

  String formattedDateTime() {
      return "${now.day} ${month[now.month-1]} ${now.year} ${now.hour}:${now.minute}";
  }

}