import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_preview/image_preview.dart';
import 'package:m_hany_store/core/bloc/bloc/api_data_bloc.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/helper/next_id_helper.dart';
import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:path/path.dart';


class AddItemShippingWidget extends StatefulWidget {
  final  CategoryModel categoriesModel;
  final ApiDataBloc<ItemModel> itemBloc;
  
  const AddItemShippingWidget({
    Key? key, 
    required this.categoriesModel,
    required this.itemBloc
  }) : super(key: key);

  @override
  State<AddItemShippingWidget> createState() => _AddItemShippingWidgetState();
}

class _AddItemShippingWidgetState extends State<AddItemShippingWidget> {
  XFile? image;
  DateTime now =  DateTime.now();
  bool isSelect = false ;
  Timer? countdownTimer;
  Duration myDuration = const Duration(days: 5);
  String name = '';
  
  late Color colorTextPlatform;
  late Color colorPlatform;

  final ImagePicker _picker = ImagePicker();
  final formKye = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final regionController = TextEditingController();
  final platformController = TextEditingController();
  final priceController = TextEditingController();
  final offerPriceController = TextEditingController();
  final dayController = TextEditingController();
  final hourController = TextEditingController();
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
  void startTimer() {
    countdownTimer =  Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }
  void setCountDown(){
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      }else{
        myDuration = Duration(seconds: seconds);
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {
  /*   String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays.remainder(12));
    final hours = strDigits(myDuration.inHours.remainder(21));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60)); */
    
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
                      onChanged: (value) {
                        name = value;
                      } ,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 10, 22, 22),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      isSelect = !isSelect;
                    });
                  },
                  child: isSelect == false ? Card(
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
                    ),
                  )
                  : Card(
                    color: ColorTheme.darkAppBar,
                    child: Column(
                      children: [
                        FormFeilds.rowTextIcon(
                          isImage: true,
                          firstIconImage: 'assets/icons/icons_offer.png',
                          text:  'add sale',
                          iconData: Icons.keyboard_arrow_down,
                          iconSize: 25,
                        ),
                        const SizedBox(
                          height: 15,
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
                                  suffixIcon: FormFeilds.containerImage(
                                    assetImage: 'assets/icons/icons_offer.png',
                                    height: 30,
                                    width: 30
                                  ),
                                  controller: offerPriceController, 
                                  keyboardType: TextInputType.number, 
                                  hintText: 'Add offer price',
                                ),
                              ),
                              const SizedBox(height: 12,),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color:  ColorTheme.backroundInput,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FormFeilds.textField(
                                      controller: dayController, 
                                      keyboardType: TextInputType.number, 
                                      hintText: 'Add day',
                                    ),
                                  ),
                                  const SizedBox(width: 12,),
                                  Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color:  ColorTheme.backroundInput,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FormFeilds.textField(
                                      controller:hourController, 
                                      keyboardType: TextInputType.number, 
                                      hintText: 'Add hour',
                                    ),
                                  ),
                                ],
                              )
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
         /*  BlocBuilder(
            bloc: widget.categoryBloc,
            builder: (context, state) {
              if(state is DataLoadedState<CategoryModel>){
                return DropdownButton<CategoryModel>(
                  items: state.data.fold(
                    [], 
                    (previousValue, element) {
                      return previousValue!..add(
                        DropdownMenuItem(
                          child: SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: Row(
                              children: [
                               SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: PhysicalModel(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Colors.black,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(8),
                                    child:FadeInImage.assetNetwork(
                                      placeholder: 'assets/icons/lloading.gif',
                                      image: element.image!,
                                      fit: BoxFit.fill,
                                      placeholderFit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 18,),
                                Expanded(
                                  // fit: FlexFit.tight,
                                  flex: 3,
                                  child: Text(
                                    element.name,
                                    style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 13,),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }), 
                  onChanged: (value){
                    setState(() {
                      selectedCategory = value;
                    });
                  }
                );
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ), */
         /*  DatePickerDialog(
            initialDate: DateTime.now() , 
            firstDate: DateTime.now(), 
            lastDate: DateTime.utc(20213,2,2),
          ), */
          /* Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            // Step 8
            /* Text(
              '$days:$hours:$minutes:$seconds',
              style: getBoldStyle(color: ColorTheme.wight,fontSize: 33),),
            const SizedBox(height: 20),
            // Step 9
            ElevatedButton(
              onPressed: startTimer,
              child: const Text(
                'Start',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            // Step 10
            ElevatedButton(
              onPressed: () {
                if (countdownTimer == null || countdownTimer!.isActive) {
                  // stopTimer();
                }
              },
              child: const Text(
                'Stop',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ), */
          ],
        ), */
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
    if (image != null){
      FormFeilds.showLoading(context);
      var file = File(image!.path);
      var nameimage = basename(image!.path);
      var random = Random().nextInt(1000000);
      nameimage = "$random$nameimage";
      var refSorage = FirebaseStorage.instance.ref(widget.categoriesModel.type).child(nameimage); 
      await refSorage.putFile(file);
      var uri =  await refSorage.getDownloadURL();
      int  id = await NextIdHelper.getNextId('items');
      ItemModel item = ItemModel(
        id: id,
        categoryId: widget.categoriesModel.id,
        colorPlatform: colorPlatform.value,
        colorTextPlatform: colorTextPlatform.value,
        name: nameController.text,
        nameArry: [name],
        image: uri, 
        region: regionController.text,
        // dayTimeOffer: int.parse(dayController.text) ,
        // hourTimeOffer: int.parse(hourController.text),
        price: priceController.text, 
        offerPrice: offerPriceController.text,
        isOffer: true,
        platform: platformController.text,
        createdAt: formattedDateTime(),
        updatedAt: '-:-:-:-',
      );
      widget.itemBloc.add(StoreDataEvent(data: item.toJson()));
      FormFeilds.showMyDialog(
        context:  context, 
        message: 'product uploaded successfully',
        actions: [ 
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(shippingPage, arguments: widget.categoriesModel);
            },
            child: FormFeilds.buttonFormField(title: 'Back to products',colorButton: ColorTheme.primary)),
        ],
      );
    }else{
      FormFeilds.showMyDialog(
        context: context, 
        message: 'please choose image', 
        actions: [
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