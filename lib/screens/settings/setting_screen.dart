import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/setting_cubit/setting_cubit.dart';
import 'package:hello_world/screens/favourite_screen.dart';
import 'package:hello_world/screens/notification_screen.dart';
import 'package:hello_world/screens/settings/about_us_screen.dart';
import 'package:hello_world/screens/settings/deep_setting_screen.dart';
import 'package:hello_world/screens/settings/faq_screen.dart';
import 'package:hello_world/screens/settings/privacy_policy_screen.dart';

import '../../widgets/setting_list_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  static String route = '/setting_screen';
  @override
  Widget build(BuildContext context) {
    List<void Function()?> onTapList = [
      () {
        Navigator.pushNamed(context, NotificationScreen.route);
      },
      () {
        Navigator.pushNamed(context, FavouritesScreen.route);
      },
      () {
        Navigator.pushNamed(context, DeepSettingScreen.route);
      },
      () {
        Navigator.pushNamed(context, PrivacyPolicyScreen.route);
      },
      () {
        Navigator.pushNamed(context, FAQScreen.route);
      },
      () {
        Navigator.pushNamed(context, AboutUsScreen.route);
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'بروفايلي',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.greenAccent.withOpacity(.2),
                      radius: 40.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: 60.0,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bilal Al Refaie',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Text(
                            'رقم الموبايل: 0959871726',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => SettingListItem(
                          label: BlocProvider.of<SettingCubit>(context)
                              .settingListLabels[index],
                          icon: BlocProvider.of<SettingCubit>(context)
                              .settingListIcons[index],
                          onTap: onTapList[index],
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 25.0,
                        ),
                    itemCount: BlocProvider.of<SettingCubit>(context)
                        .settingListLabels
                        .length),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
