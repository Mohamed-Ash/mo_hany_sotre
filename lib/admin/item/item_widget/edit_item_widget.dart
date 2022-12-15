// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
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
  bool isSelect = false ;
  double  sizedMessage = 80;
  late DateTime now = DateTime.parse('${widget.itemModel.dateOffer}');

  late Color colorRegion;
  late Color colorPlatform;
  final formKey =GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  
  var informationController = TextEditingController();
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var regionController = TextEditingController();
  var platformController = TextEditingController();
  var offerPriceController = TextEditingController();
  var urlController = TextEditingController();
  var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.parse( "${widget.itemModel.dateOffer}"),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101)
    );
    if (picked != null) {
      setState(() {
        now = picked ;
      });
    }
  }

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
        text: "${widget.itemModel.price}",
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
    if(widget.itemModel.offerPrice != null){
      offerPriceController = TextEditingController(
        text: '${widget.itemModel.offerPrice}',  
      );  
    }
    if(widget.itemModel.urlLauncher != null){
      urlController = TextEditingController(
        text: widget.itemModel.urlLauncher,  
      );  
    }
    if(widget.itemModel.info != null){
      informationController = TextEditingController(
        text: widget.itemModel.info,  
      );  
    }
    colorRegion =  Colors.red;
    colorPlatform =Colors.blue;
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
                    width: double.infinity,
                    height: sizedMessage < 90 ? sizedMessage : 200,
                    decoration: BoxDecoration(
                      color:  ColorTheme.backroundInput,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FormFeilds.textField(
                      controller: informationController, 
                      keyboardType: TextInputType.multiline, 
                      hintText: 'add information',
                      validator:(validate){
                        if(validate == null || validate.isEmpty){
                          return 'please add information';
                        }
                        return null;
                      },
                    ),
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
                    controller: urlController, 
                    keyboardType: TextInputType.text, 
                    coloInputText: const Color.fromARGB(255, 90, 174, 243),
                    hintText: 'Add Link EasyKash',
                    // hintTextColor: dialogPickerColor,
                    validator:(validate){
                      if(validate == null || validate.isEmpty){
                        return 'please add EasyKash';
                      }else if( !RegExp("https").hasMatch(validate)){
                        return 'add link pay ment';
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
                child: isSelect == false ? Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:ColorTheme.darkAppBar,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:  AssetImage('assets/icons/icons_offer.png'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'add sale',
                          style: getBoldStyle(
                            color: ColorTheme.hintText, 
                            dDecoration: TextDecoration.none,
                            fontSize: 14
                          ),
                        ),
                        const Spacer(),
                         IconButton(
                          onPressed: (){
                            setState(() {
                              isSelect = !isSelect;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorTheme.wight,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                )
                : Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color:ColorTheme.darkAppBar,
                    ),
                    child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 10, 10, 0),
                        child: Row(
                          children: [
                            Text('Add Offer price',style: getSemiBoldStyle(color: ColorTheme.wight,),),
                            const Spacer(),
                            IconButton(
                              onPressed: (){
                                setState(() {
                                  isSelect = !isSelect;
                                });
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: ColorTheme.wight,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
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
                                controller: offerPriceController, 
                                keyboardType: TextInputType.number, 
                                hintText: 'Add offer price',
                              ),
                            ),
                            const SizedBox(height: 12,),
                            Text(
                              "${now.toLocal()}".split(' ')[0],
                              style: getBoldStyle(color: ColorTheme.wight,fontSize: 20),
                            ),
                            const SizedBox(height: 20.0,),
                            GestureDetector(
                              onTap: () => _selectDate(context),
                              child: FormFeilds.buttonFormField(
                                title: 'Select date',
                                colorButton: ColorTheme.primary,
                                colorText: ColorTheme.wight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            ListTile(  
            title:  Text(
              'Click this color to choose color  Platform',
              style:  getBoldStyle(color: ColorTheme.wight,),
            ),
            trailing: ColorIndicator(
              width: 44,
              height: 44,
              borderRadius: 4,
              color: colorRegion,
              onSelectFocus: false,
              onSelect: () async {
                final Color dd = colorRegion;
                if (!(await colorRegionN(context))) {
                  setState(() {
                    colorRegion = dd;
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
            'Click this color to choose color Region',
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

  postData(context)async{
   String updatedAt = "${now.day} ${month[now.month-1]} ${now.year} ${now.hour}:${now.minute}";
   var test = offerPriceController.text == null  ||offerPriceController.text.isEmpty? 0 :  double.parse(offerPriceController.text);
    bool isOffer = test  > 0  ? true : false;
    double subtractprice = isOffer == false ? 0 : double.parse(priceController.text) - double.parse(offerPriceController.text);
    double pricePercent = double.parse(offerPriceController.text) > 0  ? subtractprice / double.parse(priceController.text) * 100 : 0;
    DateTime  date;
    if (DateTime.parse('${widget.itemModel.dateOffer}') == now) {
      date = DateTime.parse('${widget.itemModel.dateOffer}');
    } else {
      date = DateTime.parse('$now');
    }

    try{
      if (image != null){
        FirebaseStorage.instance.refFromURL(widget.itemModel.image).delete();
   
        FormFeilds.showLoading(context);

        var file = File(image!.path);

        var nameimage = basename(image!.path);

        var random = Random().nextInt(1000000);

        nameimage = "$random$nameimage";
        var refSorage = FirebaseStorage.instance.ref(widget.categoriesModel.type).child(nameimage); 
        
        await refSorage.putFile(file);

        var uri =  await refSorage.getDownloadURL();
          
        ItemModel shippingModel = ItemModel(
          categoryId: widget.itemModel.categoryId,
          createdAt: widget.itemModel.createdAt,
          name: nameController.text, 
          image: uri,
          colorRegion: colorRegion.value,
          colorPlatform: colorPlatform.value,
          info: informationController.text,
          urlLauncher: urlController.text,
          region:regionController.text, 
          platform: platformController.text,
          id: widget.itemModel.id,
          updatedAt: updatedAt,
          dateOffer: "$date",
          price: double.parse(priceController.text),
          percent: pricePercent,
          offerPrice: double.parse(offerPriceController.text),
          isOffer: isOffer,
        );
        widget.categoryBloc.add(UpdateDataEvent(id: widget.itemModel.id, data: shippingModel.toJson()));
        FormFeilds.showMyDialog(
          context:  context, 
          message: 'product uploaded successfully',
          isImage: true,
          actions: <Widget>[ 
            InkWell(
              onTap: () {
                // Navigator.pushNamedAndRemoveUntil(context, shippingPage, (route) => false);
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> ShippingPage(categoriesModel: widget.categoriesModel,)), (route) => false);
                Navigator.pop(context);
                Navigator.of(context).pushNamedAndRemoveUntil(itemPage, arguments: widget.categoriesModel,ModalRoute.withName(appPageLayout));
              },
              child: FormFeilds.buttonFormField(title: 'Back to products',colorButton: ColorTheme.primary)),
          ],
        );
      }else{
          FormFeilds.showLoading(context);
          ItemModel itemModel = ItemModel(
            urlLauncher: urlController.text,
            colorRegion: colorRegion.value,
            colorPlatform: colorPlatform.value,
            categoryId: widget.itemModel.categoryId,
            name: nameController.text, 
            createdAt: widget.itemModel.createdAt,
            image: widget.itemModel.image, 
            region:regionController.text,
            info: informationController.text,
            id: widget.itemModel.id,
            platform: platformController.text,
            updatedAt: updatedAt,
            dateOffer: "$date",

            price: double.parse(priceController.text),
            percent: pricePercent,
            offerPrice: double.parse(offerPriceController.text),
            isOffer: isOffer,
          );
          widget.categoryBloc.add(UpdateDataEvent(id: widget.itemModel.id, data: itemModel.toJson()));

          FormFeilds.showMyDialog(
          context:  context, 
          message: 'product uploaded successfully',
          isImage: true,
          actions: <Widget> [ 
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamedAndRemoveUntil(itemPage, arguments: widget.categoriesModel,ModalRoute.withName(appPageLayout));
              },
              child: FormFeilds.buttonFormField(title: 'Back to products',colorButton: ColorTheme.primary)
            ),
          ],
        );
      }
    }catch(e){
       debugPrint(e.toString());
    }
  } 
  
  Future<bool> colorRegionN(context) async {
    return ColorPicker(
      borderColor: ColorTheme.wight,
      color: colorRegion,
      onColorChanged: (Color color) => setState(() => colorRegion = color),
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
    ).showPickerDialog(
      context,
      backgroundColor: ColorTheme.darkBackroundPage,
      actionsPadding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(minHeight: 380, minWidth: 300, maxWidth: 320),
    );
  }
}