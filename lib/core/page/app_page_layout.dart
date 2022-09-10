import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/cubit/layout_cubit.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';

class AppPageLayout extends StatelessWidget{
  const AppPageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
            LayoutCubit cubit = LayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar( 
              leading: const  Text(''),
              backgroundColor: ColorTheme.primary,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor:  ColorTheme.primary,
              ),
              title: Text('M.hany_store',style: getBoldStyle(color: ColorTheme.white,fontSize: 18)), 
            ),
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