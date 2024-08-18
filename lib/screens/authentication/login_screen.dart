import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hello_world/business_logic/cubits/category_cubit/category_cubit.dart';
import 'package:hello_world/business_logic/cubits/setting_cubit/setting_cubit.dart';
import 'package:hello_world/core/helpers/messages_helper.dart';
import 'package:hello_world/screens/authentication/register_screen.dart';
import 'package:hello_world/screens/authentication/restore_account_screen.dart';
import 'package:hello_world/screens/authentication/widget/auth_field.dart';
import 'package:hello_world/screens/authentication/widget/auth_reusable_button.dart';
import 'package:hello_world/screens/authentication/widget/reusable_alt_auth.dart';
import 'package:hello_world/screens/authentication/widget/reusable_option_box.dart';
import 'package:hello_world/widgets/bottom_nav_bar.dart';

import '../../business_logic/cubits/auth_cubit/auth_cubit.dart';
import '../../business_logic/cubits/auth_cubit/auth_state.dart';
import '../../utils/theme.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static String route = '/login_screen';
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          BlocProvider.of<CategoriesCubit>(context).listVisibleCategories();
          // BlocProvider.of<StoreCubit>(context).listVisibleStores();
          BlocProvider.of<SettingCubit>(context).getProfile();
          //todo remove the comment
          // BlocProvider.of<AuthCubit>(context).emailOrPhoneController.clear();
          // BlocProvider.of<AuthCubit>(context).passwordController.clear();

          showSnackBar(context, 'تم تسحيل الدخول بنجاح', Colors.greenAccent);
          Navigator.pushNamedAndRemoveUntil(
            context,
            MyBottomNavBar.route,
            (route) => false,
          );
        } else if (state is LoginErrorState) {
          showSnackBar(context, 'حدث خطأ ما', Colors.redAccent);
        }
      },
      child: Scaffold(
        backgroundColor: MaterialTheme.lightScheme().onPrimary,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
              child: Form(
                key: loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Daily Deals',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: MaterialTheme.lightScheme().onSurface,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Text(
                      'مرحباً مجدداً بمتجرك',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: MaterialTheme.lightScheme().onSurface,
                          fontWeight: FontWeight.w300,
                          fontSize: 22.0),
                    ),
                    SvgPicture.asset(
                      'assets/images/login.svg',
                      width: 300,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableOptionBox(
                              onChanged: (value) {
                                BlocProvider.of<AuthCubit>(context)
                                    .changeEmailCheckBoxValue();
                              },
                              value: BlocProvider.of<AuthCubit>(context)
                                  .emailCheckBoxValue,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'بريد الكتروني',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color:
                                        MaterialTheme.lightScheme().surfaceTint,
                                  ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            ReusableOptionBox(
                              onChanged: (value) {
                                BlocProvider.of<AuthCubit>(context)
                                    .changePhoneCheckBoxValue();
                              },
                              value: BlocProvider.of<AuthCubit>(context)
                                  .phoneCheckBoxValue,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'موبايل',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color:
                                        MaterialTheme.lightScheme().surfaceTint,
                                  ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        return AuthField(
                          keyboardType: BlocProvider.of<AuthCubit>(context)
                                      .emailCheckBoxValue ==
                                  true
                              ? TextInputType.emailAddress
                              : TextInputType.phone,
                          hintText: BlocProvider.of<AuthCubit>(context)
                                      .emailCheckBoxValue ==
                                  true
                              ? 'البريد الالكتروني'
                              : 'الموبايل',
                          controller: BlocProvider.of<AuthCubit>(context)
                              .emailOrPhoneController,
                          suffixIcon: BlocProvider.of<AuthCubit>(context)
                                      .emailCheckBoxValue ==
                                  true
                              ? Icons.email
                              : Icons.phone,
                          validator: (value) {
                            if (value!.isEmpty == true) {
                              return 'this field must be not empty';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        return AuthField(
                          controller: BlocProvider.of<AuthCubit>(context)
                              .passwordController,
                          hintText: 'كلمة المرور',
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: Icons.lock,
                          isPassword: true,
                          validator: (value) {
                            if (value!.isEmpty == true) {
                              return 'this field must be not empty';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            padding:
                                WidgetStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.all(5)),
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              ForgetPasswordScreen.route,
                              (route) => false,
                            );
                          },
                          child: Text(
                            'نسيت كلمة المرور؟',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color: MaterialTheme.lightScheme().onSurface,
                                ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            padding:
                                WidgetStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.all(5)),
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RestoreAccountScreen.route,
                              (route) => false,
                            );
                          },
                          child: Text(
                            'استرجاع حسابك؟',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color: MaterialTheme.lightScheme().onSurface,
                                ),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        if (state is LoginLoadingState) {
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
                            label: 'التالي',
                            onPressed: () {
                              if (loginFormKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context).login();
                              }
                            },
                          );
                        }
                      },
                    ),
                    ReusableAlternativeAuthWay(
                      ask: 'لا تمتلك حساباً ؟',
                      alternativeWayText: 'انضم إلينا',
                      routeName: RegisterScreen.route,
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
