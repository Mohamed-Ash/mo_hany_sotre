

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';


class AddItemOffersPage extends StatefulWidget {
  const AddItemOffersPage({Key? key}) : super(key: key);

  @override
  State<AddItemOffersPage> createState() => _AddItemOffersPageState();
}

class _AddItemOffersPageState extends State<AddItemOffersPage> {
 XFile? imagees;

  final ImagePicker _picker = ImagePicker();
  final newPriceController = TextEditingController();
  final oldPriceController = TextEditingController();
  final nameController = TextEditingController();
  final formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKye,
        child: Column(
          children: [
            const SizedBox(height: 33,),
            if (imagees == null)
            InkWell(
              onTap: () async {
                final testgetImage = await _picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  imagees = testgetImage;
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
                    Icons.image,color: ColorTheme.wight,
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
                              imgUrls:[imagees!.path],
                              index: 0,
                            );
                          },
                          child: Image.file(
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                            File(imagees!.path)),
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
                      controller: oldPriceController, 
                      keyboardType: TextInputType.number, 
                      hintText: 'Add old price',
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
                      controller: newPriceController, 
                      keyboardType: TextInputType.number, 
                      hintText: 'Add new price',
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
               /*  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color:  ColorTheme.backroundInput,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FormFeilds.textField(
                      controller: oldPriceController, 
                      keyboardType: TextInputType., 
                      hintText: 'Add old price',
                      validator:(validate){
                        if(validate == null){
                          return 'please add price';
                        }
                        return null;
                      },
                    ),
                  ), */
                  const SizedBox(
                  width: 33,
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
                  imagees= null;
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
  postData()async{
    CollectionReference postDat = FirebaseFirestore.instance.collection('discounts product');
    postDat.add({
      "image": "https://wallpaperaccess.com/full/7070020.jpg",
      "name": nameController.text,
      "new price": newPriceController.text,
      "old price": oldPriceController.text,
      // "date": oldPriceController.text,
    }).then((value) =>
      setState(() {
        imagees = null;
      }),
    );
  } 
}