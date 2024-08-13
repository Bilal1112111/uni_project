import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:hello_world/business_logic/cubits/auth_cubit/auth_state.dart';
import 'package:hello_world/screens/authentication/login_screen.dart';
import 'package:hello_world/screens/authentication/widget/auth_field.dart';
import 'package:hello_world/screens/authentication/widget/auth_reusable_button.dart';
import 'package:hello_world/widgets/my_custom_app_bar.dart';

import '../../core/helpers/messages_helper.dart';

class RestoreAccountScreen extends StatelessWidget {
  RestoreAccountScreen({super.key});
  static String route = '/restore_account_screen';
  GlobalKey<FormState> restoreAccountGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var authCubit = AuthCubit.get(context);
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RestoreAccountSuccessState) {
          showSnackBar(context, 'تم إسترجاع حسابك بنجاح', Colors.greenAccent);
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginScreen.route,
            (route) => false,
          );
        } else if (state is RestoreAccountErrorState) {
          showSnackBar(context, 'حدث خطأ ما', Colors.redAccent);
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight + 20),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0)),
            child: MyCustomAppBar(
              label: 'استرجاع الحساب',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 14),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: restoreAccountGlobalKey,
                child: Column(
                  children: [
                    Text(
                      'من أجل استرجاع حسابك عليك تعبئة المعلومات :',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AuthField(
                      controller: authCubit.restoreAccountEmailController,
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Icons.email_outlined,
                      hintText: 'البريد الالكتروني',
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'This field must be not empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AuthField(
                      controller: authCubit.restoreAccountPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      suffixIcon: Icons.lock,
                      hintText: 'كلمة المرور',
                      validator: (password) {
                        if (password!.isEmpty) {
                          return 'This field must be not empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AuthReusableButton(
                      width: MediaQuery.sizeOf(context).width - 80,
                      label: 'استرجاع',
                      onPressed: () {
                        if (restoreAccountGlobalKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).restoreAccount();
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
