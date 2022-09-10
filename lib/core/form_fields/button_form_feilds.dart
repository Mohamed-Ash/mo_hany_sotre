
import 'package:flutter/material.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/font_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
class FormFeilds{
  static Container buttonFormField({
    required String? title,
    Color? colorButton,
    Color colorText     =  ColorTheme.white,
    double widthtButton =  double.infinity,
    double heightButton = 40,
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
            style: getBoldStyle(color: colorText, dDecoration: TextDecoration.none,),
          ),
        ),
      ),
    );
  }

  static Padding containerImage({
    required String assetImage,
    double height = 45,
    double width = 45,
  }){
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetImage)
          ),
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


  static TextFormField textField({
    required TextEditingController controller, 
    required TextInputType keyboardType,
    // required TextStyle hintStyle,
    required String hintText,
    Color cursorColor = ColorTheme.primary,
    Color hintTextColor = ColorTheme.authHint,
    InputBorder border = InputBorder.none, 
    String? Function(String?)? validator,
    EdgeInsets contentPadding = const EdgeInsets.all(12),
    double cursorHeight = 22, 
    }){
    return TextFormField(
      // textAlignVertical: textAlignVertical,
      // textAlign: textAlign,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.text,
      cursorColor: cursorColor,
      cursorHeight: cursorHeight, 
      controller: controller,
      // keyboardAppearance: Brightness.light,
      style: const TextStyle(
        color: Colors.white,
        decoration: TextDecoration.none,
        fontFamily: FontsTheme.fontFamily,
        decorationThickness: 0,
      ),
      validator: validator,
       keyboardAppearance: Brightness.dark,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hintText,
        hintStyle: getBoldStyle(color: hintTextColor, dDecoration: TextDecoration.none,),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );//getBoldStyle(color: ColorTheme.hintSearchText, dDecoration: TextDecoration.none,),
  }
  static Row rowTextIcon({
     String?  firstIconImage,
    // required String  iconImage,
    required String  text,
    required IconData iconData,
     IconData? firstIconData,
    Color iconColor = ColorTheme.white,
    required bool isIconImage,
    double iconSize = 16,
  }){
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: isIconImage == true ? BoxDecoration(
            image: DecorationImage(
              image: AssetImage(firstIconImage!),
            ),
          ): null,
          child: isIconImage == false ? Icon(
            firstIconData,
            color: iconColor,
            // size: iconSize,
          ) : null,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: getBoldStyle(color: ColorTheme.white, dDecoration: TextDecoration.none,),
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
            hintStyle: getSemiBoldStyle(color: ColorTheme.white, fontSize: 13),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: getBoldStyle(color: ColorTheme.white, fontSize: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorTheme.white),
              
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorTheme.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorTheme.white),
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
    height: 50,
    decoration:   BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      border: const Border(
        bottom: BorderSide(
          width: 1,
          color: ColorTheme.authHint
        ),
        left: BorderSide(
          width: 1,
          color: ColorTheme.authHint
        ),
        right: BorderSide(
          width: 1,
          color: ColorTheme.authHint
        ),
        top: BorderSide(
          width: 1,
          color: ColorTheme.authHint
        ),
      ),
    ),
    margin: const  EdgeInsets.fromLTRB(0, 12, 0, 12),
    child: ListTile(
      leading: FormFeilds.containerImage(assetImage: assetImage,height: 28,width: 28),
        title: Text(
          title,
          style: getSemiBoldStyle(color: ColorTheme.authHint),
        ),
        horizontalTitleGap: 33,
      ),
    );
  }
}