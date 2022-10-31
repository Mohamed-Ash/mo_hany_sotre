import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/core/bloc/cubit/layout_cubit.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';
import 'package:m_hany_store/core/theme/colors/color_theme.dart';
import 'package:m_hany_store/core/theme/fonts/style.dart';
import 'package:m_hany_store/user/user_interface.dart';

class AppPageLayout extends UserInterface{
  // BuildContext? context;
  
  const AppPageLayout({Key? key}) : super(key: key);
  
  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar( 
    leading: const  Text(''),
    elevation: 2,
    // backgroundColor: ColorTheme.primary,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor:  Colors.transparent,
    ),
    title: Text('M HANY STORE',style: getBoldStyle(color: ColorTheme.wight,fontSize: 18)), 
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: ()=> Navigator.pushNamed(context, searchPage), 
        icon: const Icon(Icons.search_sharp,color: ColorTheme.wight,),
      ),
      IconButton(
        onPressed: ()=> Navigator.pushNamed(context, notificationPage), 
        icon: FormFeilds.containerImage(assetImage: 'assets/icons/messages.png', height: 35,width: 35)
      ),
    ],
  );

  
  @override
  Widget buildBody(context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
            LayoutCubit cubit = LayoutCubit.get(context);
          return Scaffold(
            appBar: null,
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.black,
                primaryColor: Colors.black,
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(caption: const TextStyle(color: Colors.black)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(33),
                      topLeft: Radius.circular(33),
                      bottomLeft: Radius.circular(33),
                      bottomRight: Radius.circular(33),
                    ),          
                  ),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.transparent,
                    enableFeedback: true,
                    // fixedColor: Colors.transparent,
                    onTap: (index){
                      cubit.changeCurrentIndex(index);
                    },
                    // selectedItemColor: ColorTheme.darkAppBar,
                    unselectedItemColor: ColorTheme.unSelectIconNavBar,
                    landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
                    
                    backgroundColor: ColorTheme.darkAppBar,
                    currentIndex: cubit.currentIndex,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items:  [
                      BottomNavigationBarItem(
                        
                        icon: FormFeilds.containerImage(
                          assetImage: 'assets/icons/un_select_home.png',
                          height: 25,
                          width: 25,
                        ),
                        activeIcon: FormFeilds.containerImage(
                          assetImage: 'assets/icons/icons_home.png',
                          height: 25,
                          width: 25,
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: FormFeilds.containerImage(
                        assetImage: 'assets/icons/un_select_offer.png',
                        height: 30,
                        width: 30,
                        ),
                        activeIcon: FormFeilds.containerImage(
                          assetImage: 'assets/icons/icons_offer.png',
                          height: 30,
                          width: 30,
                        ),
                        label: '',
                        
                      ),
                      BottomNavigationBarItem(
                        icon: FormFeilds.containerImage(
                          assetImage: 'assets/icons/un_select_profile.png',
                          height: 25,
                          width: 25,
                        ),
                        activeIcon: FormFeilds.containerImage(
                          assetImage: 'assets/icons/icons_profile.png',
                          height: 25,
                          width: 25,
                        ),
                        label: ''
                      ),
                    ]
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  buildS ( context){
    Navigator.pushNamed(context, adminHome);
  }
}