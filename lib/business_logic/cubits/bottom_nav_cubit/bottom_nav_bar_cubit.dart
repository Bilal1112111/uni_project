import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../screens/add_advertisiment_screen/my_advertising_screen.dart';
import '../../../screens/favourite_screen.dart';
import '../../../screens/home_screen.dart';
import '../../../screens/settings/setting_screen.dart';
import 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  List<Widget> pages = [
    HomeScreen(),
    FavouritesScreen(),
    const MyAdvertisingScreen(),
    const SettingScreen(),
    // QrScreen(),
  ];

  BottomNavBarCubit() : super(BottomNavBarInitial(0, HomeScreen()));
  void onTap(int index) {
    emit(BottomNavBarCurentState(index, pages[index]));
  }
}
