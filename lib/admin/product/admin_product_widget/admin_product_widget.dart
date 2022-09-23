// ignore_for_file: avoid_print
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';

class AdminProductWidget extends StatefulWidget {
  const AdminProductWidget({Key? key}) : super(key: key);

  @override
  State<AdminProductWidget> createState() => _AdminProductWidgetState();
}

class _AdminProductWidgetState extends State<AdminProductWidget> {
  XFile? image;
  final ImagePicker _picker = ImagePicker();

  final  priceController = TextEditingController();
  final  nameController = TextEditingController();
  final formKye = GlobalKey<FormState>();

  /* postimage()async{
    final testgetImage = await _picker.pickImage(source: ImageSource.gallery);
    if(testgetImage!= null ) {
      File file = File(testgetImage.path);
      var nameimage = basename(testgetImage.path);
      var refstorage = FirebaseStorage.instance.ref(nameimage);
      await refstorage.putFile(file);
      print('=========================================');
      print(nameimage);
      print(testgetImage);
    }
      // var url = refstorage.getDownloadURL();
  
      // print( 'url ::: $url');
  
  
      // String imageName =  basename(image!.path);
    // CollectionReference postDat = FirebaseFirestore.instance.collection('product');
    //start upload
    // Reference  firebaseStorageRef = FirebaseStorage.instance.ref(imageName); 
    // await firebaseStorageRef.putFile(file);
    
    // var url = await firebaseStorageRef.getDownloadURL();

    print(url);
    // print(imageName);
    
   /*  if (image != null) {
      await postDat.doc('111111').set({
        "image":imageName,
        "info":"sss",
        "sale":false,
      }).then((value) =>
        setState(() {
          image = null;
        }),
      );
    }*/
  } */

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
                final testgetImage = await _picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  image = testgetImage;
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
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                            File(image!.path)),
                        ),
                      ),
                    ),
                  ),
                 /*  Positioned(
                    height: -8,
                    right: -9,
                    child:  IconButton(
                      onPressed: () {
                        setState(() {
                          image = null;
                        });
                      },
                      icon: const Icon(Icons.cancel,color: Colors.red,size: 55,)
                    ),
                  ), */
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
                      controller: priceController, 
                      keyboardType: TextInputType.number, 
                      hintText: 'Add price',
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
                      controller: nameController, 
                      keyboardType: TextInputType.text, 
                      hintText: 'Add name',
                      validator:(validate){
                        if(validate == null){
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
           /*  ElevatedButton.icon(
              onPressed: () async{
               await postimage();
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
  postdData(){
    CollectionReference postDat = FirebaseFirestore.instance.collection('product');
    if (image != null) {
      postDat.doc('111111').set({
        "image":image!.path,
        "info":"sss",
        "sale":false,
      }).then((value) =>
        setState(() {
          image = null;
        }),
      );
    }
  } 

  postData()async{
    CollectionReference postDat = FirebaseFirestore.instance.collection('all broducts');
    postDat.add({
      "image": "https://wallpaperaccess.com/full/7070020.jpg",
      "name": nameController.text,
      "price": priceController.text,
    }).then((value) =>
      setState(() {
        image = null;
      }),
    );
    print(postDat);
    print('=========================================');
    /* final testgetImage = await _picker.pickImage(source: ImageSource.gallery);
    if(testgetImage!= null ) {
      File file = File(testgetImage.path);
      var nameimage = basename(testgetImage.path);
      var refstorage = FirebaseStorage.instance.ref(nameimage);
      await refstorage.putFile(file);
      print('=========================================');
      print(nameimage);
      print(testgetImage);
  }
    print(url);
    print('========================================='); */
  } 
}

/* 
  Table(
          children: [
            TableRow(
              children: [
                Column(
                  children: [
                    Text('adasds',
                     style: getBoldStyle(color: ColorTheme.white,fontSize: 16),
                    ),
                    Text('adasds',
                     style: getBoldStyle(color: ColorTheme.white,fontSize: 16),
                    ),
                    Text('adasds',
                     style: getBoldStyle(color: ColorTheme.white,fontSize: 16),
                    ),
                    Text('adasds',
                     style: getBoldStyle(color: ColorTheme.white,fontSize: 16),
                    ),
                    Text('adasds',
                     style: getBoldStyle(color: ColorTheme.white,fontSize: 16),
                    ),
                    Text('adasds',
                     style: getBoldStyle(color: ColorTheme.white,fontSize: 16),
                    ),
                  ],
                ),
                 Text('adasds',
                 style: getBoldStyle(color: ColorTheme.white,fontSize: 16),
                ),
                 Text('adasds',
                 style: getBoldStyle(color: ColorTheme.white,fontSize: 16),
                ),
              ],
            ),
          ],
          border: TableBorder(
            bottom: const BorderSide(color: ColorTheme.porder),
            left: const BorderSide(color: ColorTheme.porder),
            right: const BorderSide(color: ColorTheme.porder),
            top: const BorderSide(color: ColorTheme.porder),
            borderRadius: BorderRadius.circular(8),
          ),
        ), 
 */