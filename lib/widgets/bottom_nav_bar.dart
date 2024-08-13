import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hideable_bottom_bar/hideable_bottom_bar.dart';

import '../business_logic/cubits/bottom_nav_cubit/bottom_nav_bar_cubit.dart';
import '../business_logic/cubits/bottom_nav_cubit/bottom_nav_bar_state.dart';
import '../generated/l10n.dart';
import '../utils/theme.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});
  static String route = '/';
  @override
  Widget build(BuildContext context) {
    var b = BlocProvider.of<BottomNavBarCubit>(context);

    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              state.page,
              HideableBottomBar(
                selectedItemTextStyle: TextStyle(
                  color: MaterialTheme.lightScheme().primary,
                ),
                selectedIndex: state.index,
                duration: const Duration(milliseconds: 1000),
                bottomPosition: 10,
                horizontalPadding: 15,
                backgroundColor: MaterialTheme.lightScheme().primary,
                selectedColor: MaterialTheme.lightScheme().background,
                unselectedColor: MaterialTheme.lightScheme().primary,
                children: [
                  HideableBottomNavigationItem(
                    index: 0,
                    name: S.of(context).home,
                    icon: Icons.home_filled,
                  ),
                  HideableBottomNavigationItem(
                    index: 1,
                    name: S.of(context).favorite,
                    icon: Icons.favorite,
                  ),
                  HideableBottomNavigationItem(
                    index: 2,
                    name: S.of(context).myads,
                    icon: Icons.add_box_rounded,
                  ),
                  HideableBottomNavigationItem(
                    index: 3,
                    name: S.of(context).settings,
                    icon: Icons.settings,
                  ),
                ],
                onSelected: (c) {
                  b.onTap(c.index);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
