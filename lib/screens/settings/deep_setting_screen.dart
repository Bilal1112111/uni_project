import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:hello_world/business_logic/cubits/auth_cubit/auth_state.dart';
import 'package:hello_world/business_logic/cubits/setting_cubit/setting_state.dart';
import 'package:hello_world/core/helpers/messages_helper.dart';
import 'package:hello_world/screens/settings/update_profile_screen.dart';

import '../../business_logic/cubits/setting_cubit/setting_cubit.dart';
import '../../utils/theme.dart';
import '../../widgets/setting_list_item.dart';
import '../authentication/login_screen.dart';
import '../authentication/register_screen.dart';

class DeepSettingScreen extends StatelessWidget {
  const DeepSettingScreen({super.key});
  static String route = '/deep_setting_screen';
  @override
  Widget build(BuildContext context) {
    List<void Function()?> onTapList = [
      () {
        Navigator.pushNamed(context, UpdateProfileScreen.route);
      },
      () {
        buildAwesomeDialog(
          context: context,
          title: 'حذف الحساب',
          desc: 'هل أنت متأكد من حذف حسابك ؟',
          onTap: () {
            BlocProvider.of<SettingCubit>(context).softAccountDelete();
          },
        ).show();
      },
      () {
        buildAwesomeDialog(
          context: context,
          title: 'حذف الحساب دون استرجاع',
          desc: 'هل أنت متأكد من حذف حسابك دون استرجاع ؟',
          onTap: () {
            BlocProvider.of<SettingCubit>(context).hardAccountDelete();
          },
        ).show();
      },
    ];
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is LogoutErrorState) {
              showSnackBar(context, 'حدث خطأ ما', Colors.redAccent);
            } else if (state is LogoutSuccessState) {
              showSnackBar(
                  context, 'تم تسجيل الخروج بنجاح', Colors.greenAccent);
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.route,
                (route) => false,
              );
            }
          },
        ),
        BlocListener<SettingCubit, SettingStates>(
          listener: (context, state) {
            if (state is SoftDeleteErrorState) {
              showSnackBar(context, 'حدث خطأ ما', Colors.redAccent);
            } else if (state is SoftDeleteSuccessState) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.route,
                (route) => false,
              );
              showSnackBar(context, 'تم إلغاء تفعيل حسابك', Colors.greenAccent);
            } else if (state is HardDeleteErrorState) {
              showSnackBar(context, 'حدث خطأ ما', Colors.redAccent);
            } else if (state is HardDeleteSuccessState) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RegisterScreen.route,
                (route) => false,
              );
              showSnackBar(context, 'تم حذف حسابك بالكامل', Colors.greenAccent);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'الإعدادت',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600, fontSize: 20.0),
          ),
          actions: [
            TextButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).logOut();
              },
              child: Text(
                'تسجيل الخروج',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: MaterialTheme.lightScheme().primary),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => SettingListItem(
                          onTap: onTapList[index],
                          label: BlocProvider.of<SettingCubit>(context)
                              .deepSettingListLabels[index],
                          icon: BlocProvider.of<SettingCubit>(context)
                              .deepSettingListIcons[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 25.0,
                          ),
                      itemCount: BlocProvider.of<SettingCubit>(context)
                          .deepSettingListLabels
                          .length),
                  // SettingListItem(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AwesomeDialog buildAwesomeDialog(
      {required BuildContext context,
      required void Function()? onTap,
      required String title,
      required String desc}) {
    return AwesomeDialog(
      context: context,
      btnCancelText: 'إلغاء',
      btnOkText: 'تأكيد',
      btnCancelColor: const Color(0xFFB2BBCE).withOpacity(.9),
      btnOkColor: MaterialTheme.lightScheme().primary,
      dialogType: DialogType.infoReverse,
      animType: AnimType.rightSlide,
      title: title,
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: onTap,
    );
  }
}
