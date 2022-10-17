
import 'package:flutter/material.dart';
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


  static TextFormField textField({
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
      style: const TextStyle(
        color: Colors.white,
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
    height: 50,
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
          style: getSemiBoldStyle(color: ColorTheme.hintText),
        ),
        horizontalTitleGap: 33,
      ),
    );
  }
   
  static showMyDialog({
   required final BuildContext context,
    required final String message,
    List<Widget>? actions,
    bool tabButtonRequired = false,
  }){
    return showDialog(
      context: context,
      barrierDismissible: tabButtonRequired, /// user must tap button!
      // barrierColor: ColorTheme.hintText,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: FormFeilds.containerImage(assetImage: 'assets/images/uploaded_done.png'),
          backgroundColor: ColorTheme.darkAppBar,
          actions: actions,
          alignment: Alignment.center,
          // contentPadding: EdgeInsets.fromLTRB(left, top, right, bottom) ,
          title: Text(message,style: getSemiBoldStyle(color: ColorTheme.wight,fontSize: 14)),
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

  static fixFontSize(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    if(width > 50.0 && width < 100.0 ) {
      return 11.0;
    }else if (width > 100.0 && MediaQuery.of(context).size.width < 200.0 ){
      return 12.5;
    }else{ 
      return 12.5;
    }
  }

  static fixBixiles(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    if(width > 50.0 && width < 100.0 ) {
      return 90.0;
    }else if (width > 100.0 && width < 150.0 ){
      return 125.0;
    }else if (width > 150.0 && width < 200.0 ){
      return 140.0;
    }else{
      return 160.0;
    }
  }
}