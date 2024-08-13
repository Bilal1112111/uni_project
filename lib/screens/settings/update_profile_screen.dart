import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/setting_cubit/setting_cubit.dart';
import 'package:hello_world/business_logic/cubits/setting_cubit/setting_state.dart';
import 'package:hello_world/core/helpers/messages_helper.dart';
import 'package:hello_world/screens/authentication/widget/auth_reusable_button.dart';
import 'package:hello_world/screens/settings/deep_setting_screen.dart';

import '../../utils/theme.dart';
import '../../widgets/my_custom_app_bar.dart';
import '../authentication/widget/auth_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});
  static String route = '/update_profile';
  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingCubit, SettingStates>(
      listener: (context, state) {
        if (state is UpdateProfileErrorState) {
          showSnackBar(context, 'حدث خطأ ما', Colors.redAccent);
        } else if (state is UpdateProfileSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            DeepSettingScreen.route,
            (route) => false,
          );
          BlocProvider.of<SettingCubit>(context)
              .updateProfileFirstNameController
              .clear();
          BlocProvider.of<SettingCubit>(context)
              .updateProfileLastNameController
              .clear();
          BlocProvider.of<SettingCubit>(context)
              .updateProfilePhoneController
              .clear();
          showSnackBar(context, 'تم تعديل معلوماتك بنجاح', Colors.greenAccent);
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight + 20),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0),
            ),
            child: MyCustomAppBar(
              label: 'تعديل حسابك',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                // key: editProfileCubit.editProfileGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'من أجل تعديل معلومات حسابك عليك تعبئة البيانات التالية :',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    AuthField(
                      controller: BlocProvider.of<SettingCubit>(context)
                          .updateProfileFirstNameController,
                      keyboardType: TextInputType.name,
                      suffixIcon: Icons.person,
                      hintText: 'الاسم الأول',
                      validator: (firstName) {
                        if (firstName!.isEmpty) {
                          return 'This field must be not empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    AuthField(
                      controller: BlocProvider.of<SettingCubit>(context)
                          .updateProfileLastNameController,
                      keyboardType: TextInputType.name,
                      suffixIcon: Icons.person,
                      hintText: 'الاسم الأخير',
                      validator: (lastName) {
                        if (lastName!.isEmpty) {
                          return 'This field must be not empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    AuthField(
                      controller: BlocProvider.of<SettingCubit>(context)
                          .updateProfilePhoneController,
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Icons.phone_android_rounded,
                      hintText: 'رقم الموبايل',
                      validator: (number) {
                        if (number!.isEmpty) {
                          return 'This field must be not empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    BlocBuilder<SettingCubit, SettingStates>(
                      builder: (context, state) {
                        if (state is UpdateProfileLoadingState) {
                          return SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: MaterialTheme.lightScheme().primary,
                              ),
                            ),
                          );
                        } else {
                          return AuthReusableButton(
                            width: MediaQuery.of(context).size.width - 90,
                            label: 'تعديل',
                            onPressed: () {
                              BlocProvider.of<SettingCubit>(context)
                                  .updateProfile();
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
