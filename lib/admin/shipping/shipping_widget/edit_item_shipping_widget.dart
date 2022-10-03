// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:path/path.dart';

// ignore: must_be_immutable
class EditItemShippingWidget extends StatefulWidget {
  String? id;
  DocumentSnapshot? shipping;

  EditItemShippingWidget({super.key,this.shipping,this.id});

  
  @override
  State<EditItemShippingWidget> createState() => _EditItemShippingWidgetState();
}

class _EditItemShippingWidgetState extends State<EditItemShippingWidget> {
  
  XFile? image;
  DateTime now =  DateTime.now();
  String? selectedValue;
  
  var nameController = TextEditingController();
  final formKey =GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  final formKye = GlobalKey<FormState>();
  

  final List<String> genderItems = [
    'shipping',
    'offers',
    'products',
  ];
  
  var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  
  CollectionReference postDat = FirebaseFirestore.instance.collection('categories').doc('5144z0GZ5BA4m8riyX4D').collection('shipping');

 @override
  void initState() {
    super.initState();
    if (widget.shipping != null) {
      nameController = TextEditingController(
        text: widget.shipping!['name'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              height: 22  ,
            ),
            const Divider(
              color: ColorTheme.porder,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18,0,18,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
                    style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                  ),
                  Text(
                    '${widget.shipping!['name']}',
                    style: getSemiBoldStyle(color: ColorTheme.wight,),  
                  ),
                ],
              ),
            ),  
            const Divider(
              color: ColorTheme.porder,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18,0,18,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Creatged at ',
                    style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                  ),
                  Text(
                    '${widget.shipping!['craetedAt']}',
                    style: getSemiBoldStyle(color: ColorTheme.wight,),  
                  ),
                ],
              ),
            ),  
            const Divider(
              color: ColorTheme.porder,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18,0,18,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Updated At ',
                    style: getRegulerStyle(color: ColorTheme.hintText,fontSize: 15),  
                  ),
                  Text(
                    '${widget.shipping!['updatedAt']}',
                    style: getSemiBoldStyle(color: ColorTheme.wight,),  
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
                padding:  const EdgeInsets.fromLTRB(22, 0, 22, 00),
                child: DropdownButtonFormField2(
                  decoration:  InputDecoration(
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder:  InputBorder.none,
                    border: InputBorder.none,
                    errorStyle:  getRegulerStyle(color: Colors.red,fontSize: 12),
                  ),
                  // isExpanded: false,
                  hint: Text(
                    widget.shipping!['type'],
                    style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14)
                  ),
                  icon: const Icon(
                    Icons.arrow_right_rounded,
                    color: ColorTheme.hintText,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonWidth: double.infinity,
                  buttonDecoration:BoxDecoration(
                    color: ColorTheme.backroundInput,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  dropdownPadding: const EdgeInsets.only(left: 20, right: 10),
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    color: ColorTheme.backroundInput,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: genderItems  .map((item) => DropdownMenuItem<String>(
                    value: item,
                      child: Text(
                        item,
                        style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14),
                      ),
                    )).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select type.';
                      }
                      return null;
                    },
                    onChanged: (value){
                     
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                    iconOnClick: const Icon(
                      Icons.arrow_drop_down_rounded,
                      color: ColorTheme.hintText,
                    ),
                  ),
                ),
                const SizedBox(
                  height:22, 
                ),
              InkWell(
                onTap: ()async{
                  /* if(formKye.currentState!.validate()){
                    formKye.currentState!.save();
                  } */
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
              const SizedBox(
                height: 10,
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

  postData(context)async{
    
    try{
    if (image != null){
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

      await postDat.doc(widget.id).update({
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
        });
      Navigator.pop(context);
    }else{
      FormFeilds.showLoading(context);
      await postDat.doc(widget.id).update({
        "name": nameController.text.isEmpty ? widget.shipping!['name'] : nameController.text,
        "updatedAt": formattedDateTime(),
        // "craetedAt": null,
        "type": selectedValue ?? widget.shipping!['type'] ,
      }).then((value) {
        setState(() {
          nameController.clear();
          image = null;
        });
      });
      Navigator.pop(context);
    }
    }catch(e){
       print(e);
      throw " image Not Deleted ";
    }
  } 

  String formattedDateTime() {
      return "${now.day} ${month[now.month-1]} ${now.year} ${now.hour}:${now.minute}";
  }
}