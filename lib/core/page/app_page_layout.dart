import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/cubit/layout_cubit.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

class AppPageLayout extends UserInterface{
  const AppPageLayout({Key? key}) : super(key: key);

 @override
  PreferredSizeWidget? get appBar => AppBar( 
    leading: const  Text(''),
    elevation: 0,
    // backgroundColor: ColorTheme.primary,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor:  Colors.transparent,
    ),
    title: Text('M.hany_store',style: getBoldStyle(color: ColorTheme.white,fontSize: 18)), 
  );

  
  @override
  Widget buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
            LayoutCubit cubit = LayoutCubit.get(context);
          return Scaffold(
            appBar: null,
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                  cubit.changeCurrentIndex(index);
                },
              selectedItemColor: ColorTheme.iconAppBar,
              unselectedItemColor: Colors.grey[200],
              backgroundColor: ColorTheme.darkAppBar,
              currentIndex: cubit.currentIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.discount_outlined),label: 'Sale'),
                BottomNavigationBarItem(icon: Icon(Icons.person ),label: 'Profile'),
              ]
            ),
          );
        },
      ),
    );
  }
}