// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/search_model.dart';
import 'package:m_hany_store/core/model/shipping_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:path/path.dart';

// ignore: must_be_immutable
class EditItemShippingWidget extends StatefulWidget {
  final  ShippingModel shippingModel;

  final  CategoriesModel categoriesModel;
  

  const EditItemShippingWidget({super.key,required this.shippingModel, required this.categoriesModel});

  
  @override
  State<EditItemShippingWidget> createState() => _EditItemShippingWidgetState();
}

class _EditItemShippingWidgetState extends State<EditItemShippingWidget> {
  
  XFile? image;
  DateTime now =  DateTime.now();
  
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var regionController = TextEditingController();
  var platformController = TextEditingController();

  final formKey =GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  
  
  var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  
 @override
  void initState() {
    super.initState();
    if ( widget.shippingModel.name != null) {
      nameController = TextEditingController(
        text: widget.shippingModel.name,
      );
    }
    if(widget.shippingModel.price != null){
      priceController = TextEditingController(
        text: widget.shippingModel.price,
      );
    }
    if(widget.shippingModel.region != null){
      regionController = TextEditingController(
        text: widget.shippingModel.region,

      );
    }
    if(widget.shippingModel.platform != null){
      platformController = TextEditingController(
        text: widget.shippingModel.platform,
        
      );
    }
      
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 33, 8, 8),
        child: Column(
          children: [
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
                      Icons.image,color: ColorTheme.wight,
                      size: 66,
                    ),
                   
                  ],
                ),
              )
            else
              Stack(
                alignment: Alignment.topRight,
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
                   Positioned(
                      /* top: 18,
                      right: 20, */
                      // bottom: 2,
                      // left: 2,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          image = null;
                        });
                      },
                      child: FormFeilds.containerImage(assetImage: 'assets/images/cancel.png',height: 40,width: 40),
                    ),
                  ),
                ],
              ),
            /* Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration:  BoxDecoration(
                // color: Colors.white,
                // borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(widget.categories!['images'])
                ),
              ),
            ), */
            const SizedBox(
              height: 22,
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
                    controller: nameController, 
                    keyboardType: TextInputType.text, 
                    hintText: 'Add Name',
                    validator:(validate){
                      if(validate == null || validate.isEmpty){
                        return 'please add Name';
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
                    controller: regionController, 
                    keyboardType: TextInputType.text, 
                    hintText: 'Add Region',
                    validator:(validate){
                      if(validate == null || validate.isEmpty){
                        return 'please add Region';
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
                    controller: platformController, 
                    keyboardType: TextInputType.text, 
                    hintText: 'Add platform',
                    validator:(validate){
                      if(validate == null || validate.isEmpty){
                        return 'please add platform';
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
                    controller: priceController, 
                    keyboardType: TextInputType.number, 
                    hintText: 'Add price',
                    validator:(validate){
                      if(validate == null || validate.isEmpty){
                        return 'please add price';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
                height:22, 
              ),
            InkWell(
              onTap: ()async{
                await postData(context);
              },
              child: FormFeilds.buttonFormField(
                widthtButton: double.infinity,
                heightButton: 50,
                // dPadding: false,
                title: 'Done',
                colorButton: ColorTheme.primary, 
              ),
            ),
          ],
        ),
      ),
    );
  }
/* 
   Future<void> deleteImage()async{
    try{
      await FirebaseStorage.instance.refFromURL(widget.shipping!['image']).delete();
    }catch(e){
      print(e);
      throw " image Not Deleted ";
    }
   } */
  String formattedDateTime() {
      return "${now.day} ${month[now.month-1]} ${now.year} ${now.hour}:${now.minute}";
  }

  postData(context)async{
    var postDat =  FirebaseFirestore.instance.collection('categories').doc(widget.categoriesModel.idDoc).collection(widget.categoriesModel.type);
    var postSearch =  FirebaseFirestore.instance.collection('Search');

    try{
    if (image != null){
      await FirebaseStorage.instance.refFromURL(widget.shippingModel.image).delete();
      print("==++++++++++++++==");
      print('printDeleteImage');
     
      FormFeilds.showLoading(context);

      var file = File(image!.path);

      var nameimage = basename(image!.path);

      var random = Random().nextInt(1000000);

      nameimage = "$random$nameimage";

      var refSorage = FirebaseStorage.instance.ref("shipping").child(nameimage); 
      print('=========================================');
      print(nameimage);
      await refSorage.putFile(file);

      var uri =  await refSorage.getDownloadURL();
        SearchModel searchModel =SearchModel(
          colorPlatform:0xFFF44336,
          colorTextPlatform:0xFFF44336,
          createdAt: widget.categoriesModel.createdAt,
          name: nameController.text, 
          image: uri, 
          region:regionController.text , 
          price: priceController.text, 
          platform: platformController.text ,
          idDoc: postDat.id,
          updatedAt: formattedDateTime(),
        );
        await postSearch.doc(widget.shippingModel.idDoc).update(searchModel.toJson());
        
        ShippingModel shippingModel = ShippingModel(
          colorPlatform:0xFFF44336,
          colorTextPlatform:0xFFF44336,
          createdAt: widget.categoriesModel.createdAt,
          name: nameController.text, 
          image: uri, 
          region:regionController.text , 
          price: priceController.text, 
          platform: platformController.text ,
          idDoc: postDat.id,
          updatedAt: formattedDateTime(),
        );
        await postDat.doc(widget.shippingModel.idDoc).update(shippingModel.toJson()).then((value){
        setState(() {
          image = null;

          nameController.clear();
          regionController.clear();
          priceController.clear();
        });
        print('url: $uri');
      });
      /* await postDat.doc(widget.).update({
          "image": uri,
          "name": nameController.text.isEmpty ? widget.shipping!['type'] : nameController.text,
          "updatedAt": formattedDateTime(),
          // "craetedAt": null,
          "type": selectedValue ?? widget.shipping!['type'],
        }).then((value) {
          setState(() {
            image = null;
            nameController.clear();
          });
          print('url: $uri');
        }); */
      Navigator.pop(context);
    }else{
      FormFeilds.showLoading(context);
      SearchModel searchModel =SearchModel(
       colorPlatform: 0xFFF44336,
        colorTextPlatform: 0xFFF44336,
        name: nameController.text, 
        createdAt: widget.categoriesModel.createdAt,
        image: widget.shippingModel.image, 
        region:regionController.text , 
        price: priceController.text, 
        platform: platformController.text,
        idDoc: postDat.id,
        updatedAt: formattedDateTime(),
      );
      await postSearch.doc(widget.shippingModel.idDoc).update(searchModel.toJson());

      ShippingModel shippingModel = ShippingModel(
        colorPlatform: 0xFFF44336,
        colorTextPlatform: 0xFFF44336,
        name: nameController.text, 
        createdAt: widget.categoriesModel.createdAt,
        image: widget.shippingModel.image, 
        region:regionController.text , 
        price: priceController.text, 
        platform: platformController.text,
        idDoc: postDat.id,
        updatedAt: formattedDateTime(),
      );
      await postDat.doc(widget.shippingModel.idDoc).update(shippingModel.toJson()).then((value){
        setState(() {
          image = null;

          nameController.clear();
          regionController.clear();
          priceController.clear();
          platformController.clear();
        });
        print('============');
        print('updated success');
      });
      /* await postDat.doc(widget.shippingModel.idDoc).update({
        "name": nameController.text.isEmpty ? widget.shipping!['name'] : nameController.text,
        "updatedAt": formattedDateTime(),
        // "craetedAt": null,
        "type": selectedValue ?? widget.shipping!['type'] ,
      }).then((value) {
        setState(() {
          nameController.clear();
          image = null;
        });
      }); */
      Navigator.pushNamed(context, shippingPage);
    }
    }catch(e){
       print(e.toString());
    }
  } 

 
}