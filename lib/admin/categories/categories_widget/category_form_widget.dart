import 'dart:io';
import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/helper/next_id_helper.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:path/path.dart';

class CategoryFormWidget extends StatefulWidget {

  final ApiDataBloc<CategoryModel> categoryBloc;

  const CategoryFormWidget({
    Key? key,
    required this.categoryBloc,
  }) : super(key: key);

  @override
  State<CategoryFormWidget> createState() => _CategoryFormWidgetState();
}

class _CategoryFormWidgetState extends State<CategoryFormWidget> {
  XFile? image;
  DateTime now =  DateTime.now();
  String? selectedValue;
  bool isSelect = false ;

  final ImagePicker _picker = ImagePicker();
  final nameController = TextEditingController();
  final formKye = GlobalKey<FormState>();
  

  final List<String> genderItems = [
    'Products',
    'Charge Gta v',
    'Charge Red Dead',
    'Charge Valorant',
    'Charge Steam Gift Godes',
  ];
  
  var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

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
              Padding(
                padding:  const EdgeInsets.fromLTRB(22, 0, 22, 00),
                child: DropdownButtonFormField2(
                  decoration:  InputDecoration(
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder:  InputBorder.none,
                    border: InputBorder.none,
                    errorStyle: getRegulerStyle(color: Colors.red,fontSize: 12),
                  ),
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
                  items: genderItems.map((item) => DropdownMenuItem<String>(
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
                      setState(() {
                        isSelect = !isSelect;
                      });
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
                    FormFeilds.textFormField(
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
              const SizedBox(
                height:22, 
              ),
              InkWell(
                onTap: ()async{
                  if(formKye.currentState!.validate()){
                    formKye.currentState!.save();
                    await postData(context);
                  }
                  // testDyalog(context);
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
    if (formKye.currentState!.validate() && image != null){
      FormFeilds.showLoading(context);

      var file = File(image!.path);

      var nameimage = basename(image!.path);

      var random = Random().nextInt(1000000);

      nameimage = "$random$nameimage";

      var refSorage = FirebaseStorage.instance.ref("categories").child(nameimage); 

      await refSorage.putFile(file);

      var uri =  await refSorage.getDownloadURL();
      String id = await NextIdHelper.getNextId("categories");
      CategoryModel category = CategoryModel(
        id: id, 
        image: uri,
        name: nameController.text, 
        type: selectedValue!, 
        createdAt: formattedDateTime(),
      );
      
      widget.categoryBloc.add(StoreDataEvent(data: category.toJson()));
      
     /*  await postDat.set(category.toJson()).then((value) {
        setState(() {
          nameController.clear();
          image = null;
        });
      }); */
      //Product uploaded successfully
      FormFeilds.showMyDialog(
        context:  context, 
        isImage: true,
        message: 'category uploaded successfully',
        actions: <Widget>[ 
          InkWell(
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushReplacementNamed(context, categoriesPage);
              Navigator.pushNamedAndRemoveUntil(context, categoriesPage,ModalRoute.withName(appPageLayout));
            },
            child: FormFeilds.buttonFormField(title: 'Back to categories',colorButton: ColorTheme.primary)),
        ],
      );
    }else{
      FormFeilds.showMyDialog(
        context: context, 
        message: 'please choose image',//'please fill fields', 
        actions: <Widget>[
          TextButton(
            onPressed: ()=> Navigator.of(context).pop(), 
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
}