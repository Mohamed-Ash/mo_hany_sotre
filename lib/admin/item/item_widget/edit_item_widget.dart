// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:path/path.dart';

// ignore: must_be_immutable
class EditItemShippingWidget extends StatefulWidget {
  final ApiDataBloc<ItemModel> categoryBloc;
  final CategoryModel categoriesModel;
  final ItemModel itemModel;
  

  const EditItemShippingWidget({super.key,required this.itemModel,required this.categoryBloc,required this.categoriesModel});

  
  @override
  State<EditItemShippingWidget> createState() => _EditItemShippingWidgetState();
}

class _EditItemShippingWidgetState extends State<EditItemShippingWidget> {
  XFile? image;
  DateTime now =  DateTime.now();
  bool isSelect = false ;

  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var regionController = TextEditingController();
  var platformController = TextEditingController();
  var newPriceController = TextEditingController();

  final formKey =GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  
  
  var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  
 @override
  void initState() {
    super.initState();
    if ( widget.itemModel.name != null) {
      nameController = TextEditingController(
        text: widget.itemModel.name,
      );
    }
    if(widget.itemModel.price != null){
      priceController = TextEditingController(
        text: widget.itemModel.price,
      );
    }
    if(widget.itemModel.region != null){
      regionController = TextEditingController(
        text: widget.itemModel.region,

      );
    }
    if(widget.itemModel.platform != null){
      platformController = TextEditingController(
        text: widget.itemModel.platform,
        
      );
    }
    if(widget.itemModel.platform != null){
      newPriceController = TextEditingController(
        text: widget.itemModel.offerPrice,  
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
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 10, 22, 22),
              child: InkWell(
                onTap: (){
                  setState(() {
                    isSelect = !isSelect;
                  });
                },
                child: isSelect == false? Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:  AssetImage('assets/images/discount.png'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'add sale',
                      style: getBoldStyle(
                        color: ColorTheme.wight, 
                        dDecoration: TextDecoration.none,
                        fontSize: 14
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorTheme.wight,
                      size: 16,
                    ),
                  ],
                )
                : Column(
                  children: [
                    FormFeilds.rowTextIcon(
                      isImage: true,
                      firstIconImage: 'assets/images/discount.png',
                      text:  'add sale',
                      iconData: Icons.keyboard_arrow_down,
                      iconSize: 25,
                    ),
                    const SizedBox(
                      height: 15,
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
                            suffixIcon: FormFeilds.containerImage(
                              assetImage: 'assets/images/discount.png',
                              height: 30,
                              width: 30
                              ),
                            controller: newPriceController, 
                            keyboardType: TextInputType.number, 
                            hintText: 'Add New price',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
                height:22, 
              ),
            InkWell(
              onTap: ()async{
                postData(context);
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
  String formattedDateTime() {
      return "${now.day} ${month[now.month-1]} ${now.year} ${now.hour}:${now.minute}";
  }

  postData(context)async{
    // var postDat =  FirebaseFirestore.instance.collection('categories').doc(widget.categoriesModel.idDoc).collection(widget.categoriesModel.type);
    // var postSearch =  FirebaseFirestore.instance.collection('Search');

    try{
      if (image != null){
        // await FirebaseStorage.instance.refFromURL(widget.shippingModel.image).delete();
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
          
          ItemModel shippingModel = ItemModel(
            colorPlatform:0xFFF44336,
            categoryId: widget.itemModel.categoryId,
            colorTextPlatform:0xFFF44336,
            createdAt: widget.itemModel.createdAt,
            name: nameController.text, 
            image: uri, 
            region:regionController.text, 
            price: priceController.text, 
            platform: platformController.text,
            offerPrice: newPriceController.text,
            id: widget.itemModel.id,
            updatedAt: formattedDateTime(),
          );
          widget.categoryBloc.add(UpdateDataEvent(id: widget.itemModel.id, data: shippingModel.toJson()));
        FormFeilds.showMyDialog(
          context:  context, 
          message: 'product uploaded successfully',
          actions: [ 
            InkWell(
              onTap: () {
                // Navigator.pushNamedAndRemoveUntil(context, shippingPage, (route) => false);
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> ShippingPage(categoriesModel: widget.categoriesModel,)), (route) => false);
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed(shippingPage, arguments: widget.categoriesModel);
              },
              child: FormFeilds.buttonFormField(title: 'Back to products',colorButton: ColorTheme.primary)),
          ],
        );
      }else{
        FormFeilds.showLoading(context);
        ItemModel itemModel = ItemModel(
          colorPlatform: 0xFFF44336,
          categoryId: widget.itemModel.categoryId,
          colorTextPlatform: 0xFFF44336,
          name: nameController.text, 
          createdAt: widget.itemModel.createdAt,
          image: widget.itemModel.image, 
          region:regionController.text,
          offerPrice: newPriceController.text, 
          price: priceController.text, 
          platform: platformController.text,
          id: widget.itemModel.id,
          updatedAt: formattedDateTime(),
        );
        widget.categoryBloc.add(UpdateDataEvent(id: widget.itemModel.id, data: itemModel.toJson()));

        FormFeilds.showMyDialog(
        context:  context, 
        message: 'product uploaded successfully',
        actions: [ 
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(shippingPage, arguments: widget.categoriesModel);
            },
            child: FormFeilds.buttonFormField(title: 'Back to products',colorButton: ColorTheme.primary)
          ),
        ],
      );
      }
    }catch(e){
       print(e.toString());
    }
  } 

 
}