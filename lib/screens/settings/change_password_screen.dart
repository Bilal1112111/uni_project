import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:hello_world/business_logic/cubits/auth_cubit/auth_state.dart';

import '../../widgets/my_custom_app_bar.dart';
import '../authentication/widget/auth_field.dart';
import '../authentication/widget/auth_reusable_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  static String route = '/change_password_screen';
  GlobalKey<FormState> changePasswordGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight + 20),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0)),
            child: MyCustomAppBar(
              label: 'تغيير كلمة المرور',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 40),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: changePasswordGlobalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'لتغيير كلمة المرور اتبع الخطوات',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        return AuthField(
                          controller: BlocProvider.of<AuthCubit>(context)
                              .passwordController,
                          hintText: 'كلمة المرور الحالية',
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
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        return AuthField(
                          controller: BlocProvider.of<AuthCubit>(context)
                              .passwordController,
                          hintText: 'كلمة المرور الجديدة',
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
                    const SizedBox(
                      height: 30,
                    ),
                    AuthReusableButton(
                      label: 'تغيير',
                      onPressed: () {
                        if (changePasswordGlobalKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).login();
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
