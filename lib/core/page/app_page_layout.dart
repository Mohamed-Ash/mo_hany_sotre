import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/cubit/layout_cubit.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

class AppPageLayout extends UserInterface{
  const AppPageLayout({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? get appBar => AppBar( 
    leading: const  Text(''),
    elevation: 2,
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
              selectedItemColor: ColorTheme.selectIconNavBar,
              unselectedItemColor: ColorTheme.unSelectIconNavBar,
              backgroundColor: ColorTheme.darkAppBar,
              currentIndex: cubit.currentIndex,
              items:  [
                BottomNavigationBarItem(
                  icon: FormFeilds.containerImage(
                    assetImage: 'assets/images/un_home.png',
                    height: 25,
                    width: 25,
                  ),
                  activeIcon: FormFeilds.containerImage(
                    assetImage: 'assets/images/home.png',
                    height: 25,
                    width: 25,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: FormFeilds.containerImage(
                  assetImage: 'assets/images/un_discount.png',
                  height: 30,
                  width: 30,
                  ),
                  activeIcon: FormFeilds.containerImage(
                    assetImage: 'assets/images/discount.png',
                    height: 30,
                    width: 30,
                  ),
                  label: 'Sale',
                  
                ),
                BottomNavigationBarItem(
                  icon: FormFeilds.containerImage(
                    assetImage: 'assets/images/un_profile.png',
                    height: 25,
                    width: 25,
                  ),
                  activeIcon: FormFeilds.containerImage(
                    assetImage: 'assets/images/profile.png',
                    height: 25,
                    width: 25,
                  ),
                  label: 'Profile'
                ),
              ]
            ),
          );
        },
      ),
    );
  }
}