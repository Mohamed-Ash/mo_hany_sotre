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
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:path/path.dart';

// ignore: must_be_immutable
class EditItemCategoriesWidget extends StatefulWidget {
  final CategoriesModel categoriesModel;
  const EditItemCategoriesWidget({super.key, required this.categoriesModel});
  /* String? id;
  DocumentSnapshot? categories; */

    // EditItemCategoriesWidget({super.key,required this.id,required this.categories});
  
  @override
  State<EditItemCategoriesWidget> createState() => _EditItemCategoriesWidgetState();
}

class _EditItemCategoriesWidgetState extends State<EditItemCategoriesWidget> {
  
  XFile? image;
  DateTime now =  DateTime.now();
  String? selectedValue;
  
  final nameController = TextEditingController();
  final formKey =GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  final formKye = GlobalKey<FormState>();
  

  final List<String> genderItems = [
    'shipping',
    'offers',
    'products',
  ];
  
  var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  

  // var editData = FirebaseFirestore.instance.collection('categories');
 
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
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
                      widget.categoriesModel.name,
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
                       '${widget.categoriesModel.createdAt}',
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
                      '2022/9/9 09:30 pm',
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
                      'Select Type',
                      style: getSemiBoldStyle(color: ColorTheme.hintText,fontSize: 14)
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
      ),
    );
  }

   /* Future<void> deleteImage()async{
    try{
      await FirebaseStorage.instance.refFromURL(widget.categories!['images']).delete();
    }catch(e){
      print(e);
      throw " image Not Deleted ";
    }
   } */

  postData(context)async{
    var editItemCategories = FirebaseFirestore.instance.collection('categories');
    try{  
    if (formKye.currentState!.validate() && image != null){
      await FirebaseStorage.instance.refFromURL("${widget.categoriesModel.image}").delete();

      print("==++++++++++++++==");
      print('printDeleteImage');
     
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
      CategoriesModel category = CategoriesModel(
        createdAt: widget.categoriesModel.createdAt,
        id: widget.categoriesModel.id,
        idDoc: widget.categoriesModel.idDoc,
        // start update 
        image: uri,
        name: nameController.text, 
        type: "selectedValue!",
        updatedAt: now.toIso8601String(),
      );
      await editItemCategories.doc(widget.categoriesModel.idDoc).update(category.toJson()).then((value) {
          setState(() {
            image = null;
          });
          print('url: $uri');
        });
      Navigator.pop(context);
    }else if(formKye.currentState!.validate()){
       CategoriesModel category = CategoriesModel(
        createdAt: widget.categoriesModel.createdAt,
        id: widget.categoriesModel.id,
        idDoc: widget.categoriesModel.idDoc,
        image: widget.categoriesModel.image,
        // start update 
        name: nameController.text, 
        type: "selectedValue!", 
        updatedAt: now.toIso8601String(),
      );
      FormFeilds.showLoading(context);
      await editItemCategories.doc(widget.categoriesModel.idDoc).update(category.toJson()).then((value) {
        setState(() {
          image = null;
        });
      });
      Navigator.pop(context);
    }
    }catch(e){
       print(e);
    }
  } 

  String formattedDateTime() {
      return "${now.day} ${month[now.month]} ${now.year} ${now.hour}:${now.minute}";
  }
} 