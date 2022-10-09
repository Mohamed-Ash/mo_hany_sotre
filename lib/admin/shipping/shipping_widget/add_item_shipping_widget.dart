// ignore_for_file: avoid_print
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/search_model.dart';
import 'package:m_hany_store/core/model/shipping_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:path/path.dart';

class AddItemShippingWidget extends StatefulWidget {
  final  CategoriesModel categoriesModel;
  const AddItemShippingWidget({Key? key, required this.categoriesModel}) : super(key: key);

  @override
  State<AddItemShippingWidget> createState() => _AddItemShippingWidgetState();
}

class _AddItemShippingWidgetState extends State<AddItemShippingWidget> {
  XFile? image;
  DateTime now =  DateTime.now();
  String? selectedValue;
  bool isSelect = false ;

  late Color colorTextPlatform; // Color for picker in dialog using onChanged
  late Color colorPlatform; // Color for picker in dialog using onChanged



  final ImagePicker _picker = ImagePicker();
  final nameController = TextEditingController();
  final regionController = TextEditingController();
  final platformController = TextEditingController();
  final priceController = TextEditingController();
  final formKye = GlobalKey<FormState>();
  

  final List<String> genderItems = [
    'Offers',
    'Products',
    'Shipping Gta v',
    'Shipping Red Dead',
    'Shipping Valorant',
    'Shipping Steam Gift Godes',
  ];
  
  var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];


  @override
  void initState() {
    super.initState();
    colorTextPlatform = Colors.red;
    colorPlatform = Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKye,
        child: Column(
          children: [
            const SizedBox(height: 22,),
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
                        child: FormFeilds.containerImage(assetImage: 'assets/images/cancel.png',height: 40,width: 40)),
                    ) ,
                ],
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
                      // hintTextColor: dialogPickerColor,
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
                height:33, 
              ),
              ListTile(  
              title:  Text(
                'Click this color to choose color Text Platform',
                style:  getBoldStyle(color: ColorTheme.wight,),
              ),
              trailing: ColorIndicator(
                width: 44,
                height: 44,
                borderRadius: 4,
                color: colorTextPlatform,
                onSelectFocus: false,
                onSelect: () async {
                  final Color dd = colorTextPlatform;
                  if (!(await colorTextform(context))) {
                    setState(() {
                      colorTextPlatform = dd;
                    });
                  }
                },
              ),
            ),
              const SizedBox(
                height:33, 
              ),
              ListTile(  
              title:  Text(
                'Click this color to choose color Platform',
                style:  getBoldStyle(color: ColorTheme.wight,),
              ),
              trailing: ColorIndicator(
                width: 44,
                height: 44,
                borderRadius: 4,
                color: colorPlatform,
                onSelectFocus: false,
                onSelect: () async {
                  final Color ss = colorPlatform;
                  if (!(await colorpPlatform(context))) {
                    setState(() {
                      colorPlatform = ss;
                    });
                  }
                },
              ),
            ),
              const SizedBox(
                height:33, 
              ),
              InkWell(
                onTap: ()async{
                  if(formKye.currentState!.validate()){
                    formKye.currentState!.save();
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
    // CollectionReference postDat = FirebaseFirestore.instance.collection('categories').doc('5144z0GZ5BA4m8riyX4D').collection('shipping');
    var postDat =  FirebaseFirestore.instance.collection('categories').doc(widget.categoriesModel.idDoc).collection(widget.categoriesModel.type).doc();
    var postSearch =  FirebaseFirestore.instance.collection('Search').doc(postDat.id);
    
    if (image != null){
      FormFeilds.showLoading(context);

      var file = File(image!.path);

      var nameimage = basename(image!.path);

      var random = Random().nextInt(1000000);

      nameimage = "$random$nameimage";

      var refSorage = FirebaseStorage.instance.ref(widget.categoriesModel.type).child(nameimage); 
      print('=========================================');
      print(nameimage);

      await refSorage.putFile(file);

      var uri =  await refSorage.getDownloadURL();

      SearchModel searchModel = SearchModel(
        colorPlatform: colorPlatform.value,
        colorTextPlatform: colorTextPlatform.value,
        name: nameController.text,
        image: uri, 
        idDoc: postDat.id,
        region: regionController.text,
        price: priceController.text, 
        platform: platformController.text,
        createdAt: formattedDateTime(),
        updatedAt: '-:-:-:-',
      );
      
      await postSearch.set(searchModel.toJson());
      
      ShippingModel shipping = ShippingModel(
        colorPlatform: colorPlatform.value,
        colorTextPlatform: colorTextPlatform.value,
        name: nameController.text,
        image: uri, 
        idDoc: postDat.id,
        region: regionController.text,
        price: priceController.text, 
        platform: platformController.text,
        createdAt: formattedDateTime(),
        updatedAt: '-:-:-:-',
      );
        await postDat.set(shipping.toJson()).then((value){
          setState(() {
            image = null;

            nameController.clear();
            regionController.clear();
            platformController.clear();
            priceController.clear();
          });
          print('url: $uri');
        });
     Navigator.pushNamed(context, shippingPage);
    }else{
      FormFeilds.showMyDialog(
        context, 
        'please choose image', 
        [
          TextButton(
            onPressed: ()=>Navigator.of(context).pop(), 
            child: Text(
              'Okay',
              style: getBoldStyle(color: ColorTheme.wight,
              )
            ),
          ),
        ]
      );
    }
  } 

  String formattedDateTime() {
    return "${now.day} ${month[now.month-1]} ${now.year} ${now.hour}:${now.minute}";
  }

  Future<bool> colorTextform(context) async {
    return ColorPicker(
      borderColor: ColorTheme.wight,
      color: colorTextPlatform,
      onColorChanged: (Color color) => setState(() => colorTextPlatform = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: getBoldStyle(color: ColorTheme.wight,),
      ),
      subheading: Text(
        'Select color shade',
        style: getBoldStyle(color: ColorTheme.wight,),
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: getBoldStyle(color: ColorTheme.wight,),
      ),
      showMaterialName: true,
      showColorName: true,
      colorNameTextStyle:getBoldStyle(color: ColorTheme.wight,),
      colorCodePrefixStyle: getBoldStyle(color: ColorTheme.wight,),
      colorCodeTextStyle: getBoldStyle(color: ColorTheme.wight,),
      pickerTypeTextStyle: getBoldStyle(color: ColorTheme.wight,),
      showColorCode: true,
      materialNameTextStyle: getBoldStyle(color: ColorTheme.wight,),
      
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
        ColorPickerType.custom: false,
        ColorPickerType.wheel: true,
      },
      // customColorSwatchesAndNames: colorsNameMap, /// value color
    ).showPickerDialog(
      context,
      backgroundColor: ColorTheme.darkBackroundPage,
      actionsPadding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(minHeight: 380, minWidth: 300, maxWidth: 320),
    );
  }

  Future<bool> colorpPlatform(context) async {
    return ColorPicker(
      borderColor: ColorTheme.wight,
      color: colorPlatform,
      onColorChanged: (Color color) => setState(() => colorPlatform = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: getBoldStyle(color: ColorTheme.wight,),
      ),
      subheading: Text(
        'Select color shade',
        style: getBoldStyle(color: ColorTheme.wight,),
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: getBoldStyle(color: ColorTheme.wight,),
      ),
      showMaterialName: true,
      showColorName: true,
      colorNameTextStyle:getBoldStyle(color: ColorTheme.wight,),
      colorCodePrefixStyle: getBoldStyle(color: ColorTheme.wight,),
      colorCodeTextStyle: getBoldStyle(color: ColorTheme.wight,),
      pickerTypeTextStyle: getBoldStyle(color: ColorTheme.wight,),
      showColorCode: true,
      materialNameTextStyle: getBoldStyle(color: ColorTheme.wight,),
      
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
        ColorPickerType.bw: false,
        ColorPickerType.custom: false,
        ColorPickerType.wheel: true,
      },
      // customColorSwatchesAndNames: colorsNameMap, /// value color
    ).showPickerDialog(
      context,
      backgroundColor: ColorTheme.darkBackroundPage,
      actionsPadding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(minHeight: 380, minWidth: 300, maxWidth: 320),
    );
  }
}