// ignore_for_file: unnecessary_null_comparison, avoid_print

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
  double? percent;
  Duration myDuration = const Duration(days: 5);
  String name = '';
  double  sizedMessage = 80;
  
  late Color colorRegion;
  late Color colorPlatform;

  final ImagePicker _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final regionController = TextEditingController();
  final platformController = TextEditingController();
  final priceController = TextEditingController();
  final offerPriceController = TextEditingController(text: '0');
  final dayController = TextEditingController();
  final hourController = TextEditingController();
  final urlController = TextEditingController();
  final informationController = TextEditingController();

  var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
   DateTime selectedDate = DateTime.now();

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101)
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    colorRegion  =Colors.red;
    colorPlatform =Colors.blue;
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: formKey,
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
                              "${selectedDate.toLocal()}".split(' ')[0],
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
          height:33, 
        ),
          InkWell(
            onTap: ()async{
              if(formKey.currentState!.validate()){
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
            height: 40,
          ),
        ],
      ),
    );
  }

  
  Future<void> postData(context) async {
    String createdAt = "${now.day} ${month[now.month-1]} ${now.year} ${now.hour}:${now.minute}";
    bool isOffer = double.parse(offerPriceController.text) > 0  ? true : false;
    double subtractprice = double.parse(priceController.text) - double.parse(offerPriceController.text);
    double pricePercent = double.parse(offerPriceController.text) > 0  ? subtractprice / double.parse(priceController.text) * 100 : 0;
    try{
      if (image != null) {
        FormFeilds.showLoading(context);
        var file = File(image!.path);
        var nameimage = basename(image!.path);
        var random = Random().nextInt(1000000);
        nameimage = "$random$nameimage";
        var refSorage = FirebaseStorage.instance.ref(widget.categoriesModel.type).child(nameimage); 
        await refSorage.putFile(file);
        var uri =  await refSorage.getDownloadURL();
        String  id = await NextIdHelper.getNextId('items');
        ItemModel item = ItemModel(
          id: id,
          categoryId: widget.categoriesModel.id,
          urlLauncher: urlController.text,
          colorPlatform: colorPlatform.value,
          colorRegion: colorRegion.value,
          name: nameController.text,
          info: informationController.text,
          image: uri, 
          region: regionController.text,
          platform: platformController.text,
          createdAt: createdAt,
          updatedAt: '-:-:-:-',
          price: double.parse(priceController.text),
          percent: pricePercent,
          offerPrice: double.parse(offerPriceController.text),
          isOffer: isOffer,
          dateOffer: "$selectedDate"
        );
        widget.itemBloc.add(StoreDataEvent(data: item.toJson()));
        FormFeilds.showMyDialog(
          context:  context, 
          isImage: true,
          message: 'product uploaded successfully',
          actions: <Widget>[ 
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed(itemPage, arguments: widget.categoriesModel);
              },
              child: FormFeilds.buttonFormField(title: 'Back to products',colorButton: ColorTheme.primary),
            ),
          ],
        );
      }else{
        FormFeilds.showMyDialog(
          context: context, 
          message: 'please choose image', 
          actions: <Widget>[
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
    } catch(e){
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

/* Future<void> messageHandler(RemoteMessage message) async {
  Data notificationMessage = Data.fromJson(message.data);
  debugPrint('notification from background : ${notificationMessage.title}');

}

void firebaseMessagingListener() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    Data notificationMessage = Data.fromJson(message.data);
    prdebugPrintint('notification from foreground : ${notificationMessage.title}');

  });
} */



/* Future<String?> getDeviceToken()  async{
  return await FirebaseMessaging.instance.getToken();
} */