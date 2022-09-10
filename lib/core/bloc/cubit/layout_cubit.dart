import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m_hany_store/user/home/home_page/home_page.dart';
import 'package:m_hany_store/user/profile/profile_page/profile_page.dart';
import 'package:m_hany_store/user/sale/sale_page/sale_page.dart';
// import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;

  List<Widget> screen = [
    const HomePage(),
    const SalePage(),
    const ProfilePage(),
  ] ;

  changeCurrentIndex(int index ){
    currentIndex = index;
    emit(CurrentIndexState());
  }

}
