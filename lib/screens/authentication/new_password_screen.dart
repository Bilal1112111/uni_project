import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/screens/authentication/widget/auth_field.dart';
import 'package:hello_world/screens/authentication/widget/auth_reusable_button.dart';

import '../../business_logic/cubits/auth_cubit/auth_cubit.dart';
import '../../business_logic/cubits/auth_cubit/auth_state.dart';
import '../../widgets/my_custom_app_bar.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});
  GlobalKey<FormState> restPasswordGlobalKey = GlobalKey<FormState>();
  static String route = '/new_password_screen';
  @override
  Widget build(BuildContext context) {
    var authCubit = AuthCubit.get(context);
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        // if (state is LoadingState) {
        //   const Center(
        //     child: CircularProgressIndicator(
        //       color: primaryColor,
        //     ),
        //   );
        // } else if (state is NewPasswordSuccessfulState) {
        //   showSnackBar(context, 'Password Reset Successfully', Colors.green);
        //   navigateAndFinish(context, LoginScreen.route);
        // } else if (state is NewPasswordErrorState) {
        //   showSnackBar(context, 'Error Occurred', Colors.redAccent);
        // }
      },
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
                key: restPasswordGlobalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'أضف كلمة المرور الجديدة الخاصة بك',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        return AuthField(
                          controller: authCubit.newPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: authCubit.newIsVisible,
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: !authCubit.newIsVisible
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                          onPasswordPressed: authCubit.newPasswordVisibility,
                          hintText: 'كلمة المرور الجديدة',
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        return AuthField(
                          controller: authCubit.confirmNewPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: authCubit.confirmIsVisible,
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: !authCubit.confirmIsVisible
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                          hintText: 'تأكيد كلمة المرور',
                          onPasswordPressed:
                              authCubit.confirmPasswordVisibility,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AuthReusableButton(
                        width: MediaQuery.of(context).size.width - 80,
                        label: 'تأكيد',
                        onPressed: () {
                          // newPasswordCubit.resetPassword();
                          // if (restPasswordGlobalKey.currentState!.validate() &&
                          //     newPasswordCubit.confirmPasswordController ==
                          //         newPasswordCubit.newPasswordController) {
                          //
                          // }
                        })
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
