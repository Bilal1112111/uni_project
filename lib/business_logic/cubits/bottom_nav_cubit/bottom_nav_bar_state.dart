import 'package:flutter/material.dart';

@immutable
sealed class BottomNavBarState {
  final Widget page;
  final int index;
  const BottomNavBarState(this.index, this.page);
}

final class BottomNavBarInitial extends BottomNavBarState {
  const BottomNavBarInitial(super.index, super.page);
}

final class BottomNavBarCurentState extends BottomNavBarState {
  const BottomNavBarCurentState(super.index, super.page);
}
