// ignore_for_file: avoid_print
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  final ImagePicker _picker = ImagePicker();

  final  hintController = TextEditingController();
  final  titleController = TextEditingController();
  final formKye = GlobalKey<FormState>();
  uploadImages()async{
    var imagePiced =await _picker.pickImage(source: ImageSource.camera);
    
    if (imagePiced != null){
    var file = File(imagePiced.path);
      var nameimage = basename(imagePiced.path);
    var refSorage = FirebaseStorage.instance.ref(nameimage); 
    await refSorage.putFile(file);
    var url = await refSorage.getDownloadURL();
    print('=========================================');
    print(nameimage);
    print('=========================================');
    print('url: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKye,
        child: Column(
          children: [
            const SizedBox(height: 33,),
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
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            File(image!.path)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
               height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color:  ColorTheme.backroundInput,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FormFeilds.textField(
                      controller: hintController, 
                      keyboardType: TextInputType.number, 
                      hintText: 'Add hint',
                      validator:(validate){
                        if(validate == null){
                          return 'please add price';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                  width: 33,
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color:  ColorTheme.backroundInput,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FormFeilds.textField(
                      controller: titleController, 
                      keyboardType: TextInputType.text, 
                      hintText: 'Add title',
                      validator:(validate){
                        if(validate!.isEmpty){
                          return 'please add product name ';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Divider(
                    color: ColorTheme.primary,
                    thickness: 2.32,
                  ),
                ),
                const SizedBox(
                  height: 20,
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
            ElevatedButton.icon(
              onPressed: () async{
                if(formKye.currentState!.validate()){
                  await postData();
                }
              },
              label: const Text('done'),
              icon: FormFeilds.containerImage(assetImage: 'assets/images/upload.png',height: 30,width: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            /* ElevatedButton.icon(
              onPressed: () async{
                uploadImages();
              },
              label: const Text('fire store & storage'),
              icon: const Icon(Icons.close),
            ), */
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
  
  postData()async{
    CollectionReference postDat = FirebaseFirestore.instance.collection('categories');
    
    if (image != null){

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
          "title": titleController.text,
          "hint": hintController.text,
        }).then((value) {
          setState(() {
            image = null;
          });
          print('url: $uri');
        });
    }
   /*  print('=========================================');
    print(nameimage);
    print('=========================================');
    print(postDat);
    print('========================================='); */
  } 
}