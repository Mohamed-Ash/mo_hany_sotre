
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
class FormFeilds{
  static Container buttonFormField({
    required String? title,
    Color? colorButton,
    Color colorText     =  ColorTheme.wight,
    double widthtButton =  double.infinity,
    double heightButton = 40,
    double fontSize = 15,
    bool dPadding = true,
  }){
    return Container(
      padding: dPadding == true? const EdgeInsets.fromLTRB(60, 0, 60, 0) : null,
      child: Container(
        width: widthtButton,
        height: heightButton,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), 
          color: colorButton,
        ),
        child: Center(
          child: Text(
            title!,
            style: getBoldStyle(color: colorText, dDecoration: TextDecoration.none, fontSize: fontSize ),
          ),
        ),
      ),
    );
  }

  static Container containerImage({
    required String assetImage,
    double height = 45,
    double width = 45,
  }){
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImage)
        ),
      ),
    );
  }


  static Container images({
    required String assetImage,
    double height = 160,
  }){
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImage),
        ),
      ),
    );
  }


  static TextFormField textFormField({
    required TextEditingController controller, 
    required TextInputType keyboardType,
    bool obscureText = false,
    // required TextStyle hintStyle,
    required String hintText,
    Color cursorColor = ColorTheme.primary,
    Color hintTextColor = ColorTheme.hintText,
    InputBorder border = InputBorder.none, 
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    Color coloInputText = Colors.white,
    EdgeInsets contentPadding = const EdgeInsets.all(12),
    double cursorHeight = 22, 
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? initialValue
    }){
    return TextFormField(
      // textAlignVertical: textAlignVertical,
      // textAlign: textAlign,
      initialValue: initialValue,
      
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType,
      cursorColor: cursorColor,
      cursorHeight: cursorHeight, 
      controller: controller,
      obscureText: obscureText,
      // keyboardAppearance: Brightness.light,
      style: TextStyle(
        color: coloInputText,
        decoration: TextDecoration.none,
        fontFamily: FontsTheme.fontFamily,
        decorationThickness: 0,
      ),
      validator: validator,
      onChanged: onChanged,
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.fromLTRB(12, 22, 0, -10),
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: contentPadding,
        errorStyle: getRegulerStyle(color: Colors.red,fontSize: 12),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconColor: ColorTheme.primary,
        hintStyle: getBoldStyle(color: hintTextColor, dDecoration: TextDecoration.none,),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
  static TextField textField({
    required TextEditingController controller, 
    required TextInputType keyboardType,
    bool obscureText = false,
    // required TextStyle hintStyle,
    required String hintText,
    Color cursorColor = ColorTheme.primary,
    Color hintTextColor = ColorTheme.hintText,
    InputBorder border = InputBorder.none, 
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    Color coloInputText = Colors.white,
    EdgeInsets contentPadding = const EdgeInsets.all(12),
    double cursorHeight = 22, 
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? initialValue
    }){
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType,
      cursorColor: cursorColor,
      cursorHeight: cursorHeight, 
      controller: controller,
      maxLines: null,
      obscureText: obscureText,
      // keyboardAppearance: Brightness.light,
      style: TextStyle(
        
        color: coloInputText,
        decoration: TextDecoration.none,
        fontFamily: FontsTheme.fontFamily,
        decorationThickness: 0,
      ),
      onChanged: onChanged,
      keyboardAppearance: Brightness.dark,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.fromLTRB(12, 22, 0, -10),
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: contentPadding,
        errorStyle: getRegulerStyle(color: Colors.red,fontSize: 12),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle: getBoldStyle(color: hintTextColor, dDecoration: TextDecoration.none,),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }

  static Row rowTextIcon({
     String?  firstIconImage,
    // required String  iconImage,
    required String  text,
    required IconData iconData,
     IconData? firstIconData,
    Color iconColor = ColorTheme.wight,
    required bool isImage,
    double iconSize = 16,
  }){
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: isImage == true ? BoxDecoration(
            image: DecorationImage(
              image: AssetImage(firstIconImage!),
            ),
          ): null,
          child: isImage == false ? Icon(
            firstIconData,
            color: iconColor,
          ) : null,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: getBoldStyle(color: ColorTheme.wight, dDecoration: TextDecoration.none,),
        ),
        const Spacer(),
        Icon(
          iconData,
          color: iconColor,
          size: iconSize,
        ),
      ],
    );
  }

  static Padding formFieldEditProfile({
    required String labelText,
    required String hintText,
    required IconData iconData
  }){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: TextFormField(
          cursorColor: ColorTheme.primary,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            // contentPadding: const EdgeInsets.all(22),
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(20 , 0, 0,0),
              child: Icon( 
                iconData,
                // color: ColorTheme.iconEditProfile,
              ),
            ),
            floatingLabelStyle:  getBoldStyle(color: ColorTheme.primary,fontSize: 15),
            labelText: labelText, //' الاسم ',
            hintText: hintText,//'عبدالرحمن خالد',
            hintStyle: getSemiBoldStyle(color: ColorTheme.wight, fontSize: 13),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: getBoldStyle(color: ColorTheme.wight, fontSize: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorTheme.wight),
              
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorTheme.wight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorTheme.wight),
              // gapPadding: 8,
            ),
            // enabledBorder: InputBorder.none
          ),
        ),
      ),
    );
  }

  static Container continueWith({
     required final String title,
     required final String assetImage,
  }){
    return Container(
    width: double.infinity,
    height: 60,
    decoration:   BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      border: const Border(
        bottom: BorderSide(
          width: 1,
          color: ColorTheme.hintText
        ),
        left: BorderSide(
          width: 1,
          color: ColorTheme.hintText
        ),
        right: BorderSide(
          width: 1,
          color: ColorTheme.hintText
        ),
        top: BorderSide(
          width: 1,
          color: ColorTheme.hintText
        ),
      ),
    ),
    margin: const  EdgeInsets.fromLTRB(0, 12, 0, 12),
    child: ListTile(
      leading: FormFeilds.containerImage(assetImage: assetImage,height: 28,width: 28),
        title: Text(
          title,
          style: getSemiBoldStyle(color: ColorTheme.wight),
        ),
        horizontalTitleGap: 33,
        minVerticalPadding: 0,
      ),
    );
  }
   
  static showMyDialog({
   required final BuildContext context,
    required final String message,
    String selectMessage = '',
    Color selectMessageColor = ColorTheme.wight,
    List<Widget>? actions,
    bool tabButton = false,
    String image = 'assets/images/uploaded_done.png',
    bool isImage = false,
    double heightImage = 35,
    double widthImage = 35,
  }){
    return showDialog(
      context: context,
      barrierDismissible: tabButton, /// user must tap button!
      // barrierColor: ColorTheme.hintText,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: isImage == true ? FormFeilds.containerImage(assetImage: image,height: heightImage,width:widthImage ) : null,
          backgroundColor: ColorTheme.darkAppBar,
          actions: actions,
          alignment: Alignment.center,
          // contentPadding: EdgeInsets.fromLTRB(left, top, right, bottom) ,
          title: Column(
            children: [
              Text(message,style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14)),
              const SizedBox(
                height: 15,
              ),
              SelectableText(
                selectMessage,
                style: getBoldStyle(color: Colors.blue,fontSize: 16),
                toolbarOptions: const ToolbarOptions(copy: true,cut: false,paste: false,selectAll: false),
                // onSelectionChanged: (selection, cause) => Text('Copyed'),
                autofocus: true,
                onTap: () {
                  Clipboard.setData(const ClipboardData(text: "01068693963"),
                  );
                },
              ) 
            ],
          ),
          // content: Text(message,style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14)),
        );
      },
    );
  }

   static deleteMessage(
    context,
    String message,
    Widget buttonDelete,
    // Widget buttonCancel,
  ){
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorTheme.darkAppBar,
          actions: [
            buttonDelete,
          ],
          icon: FormFeilds.containerImage(assetImage: 'assets/images/cancel.png'),
          title: Text(message,style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14)),
        );
      },
    );
  }
  static showLoading(context){
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.transparent,
          // title: Text('please waite'),
          content:  SizedBox(
            height: 50,
            child:  Center(
              child:  CircularProgressIndicator(
                color: ColorTheme.primary,
              ),
            ),
          ),
        );
      },
    );
  }

/*   static fixFontSize(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    if(width > 50.0 || width < 100.0 ) {
      return 11.0;
    }else if (width > 100.0 || width < 200.0 ){
      return 12.0;
    }else{ 
      return 12.5;
    }
  }

  static fixBixiles(BuildContext context,double width){
    
    if(width >= 50.0 || width <= 100.0 ) {
      return 120.0;
    }else if (width > 100.0 || width < 150.0 ){
      return 180.0;
    }else if (width > 150.0 || width < 200.0 ){
      return 270.0;
    }else{
      return 405.0;
    }
  } */
}