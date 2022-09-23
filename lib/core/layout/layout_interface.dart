import 'package:flutter/material.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';

// ignore: must_be_immutable
abstract class LayoutInterface extends StatelessWidget{
  PreferredSizeWidget? get  appBar => null;

  Widget buildBody(BuildContext context);

  Widget? get  buildDrawer => null ;

  Color? get  backgroundColor => null ;
  
  const LayoutInterface({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: ColorTheme.darkBackroundPage,  
      appBar:appBar,
      drawer:buildDrawer,
      body: buildBody(context),
    );
    /* return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: SafeArea(child: buildBody(context)),
        drawer: buildDrawer,
      ),
    ); */
  }
}