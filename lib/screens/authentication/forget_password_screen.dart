import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:hello_world/business_logic/cubits/auth_cubit/auth_state.dart';
import 'package:hello_world/screens/authentication/verification_screen.dart';
import 'package:hello_world/screens/authentication/widget/auth_field.dart';
import 'package:hello_world/screens/authentication/widget/auth_reusable_button.dart';
import 'package:hello_world/widgets/my_custom_app_bar.dart';

import '../../core/helpers/messages_helper.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  static String route = '/forget_password_screen';
  GlobalKey<FormState> forgetPasswordGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var authCubit = AuthCubit.get(context);
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccessState) {
          showSnackBar(
              context, 'تم إرسال الرمز للايميل بنجاح', Colors.greenAccent);
          Navigator.pushNamedAndRemoveUntil(
            context,
            VerificationScreen.route,
            arguments: {
              'con': true,
            },
            (route) => false,
          );
        } else if (state is ForgetPasswordErrorState) {
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
              label: 'نسيان كلمة المرور',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 14),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: forgetPasswordGlobalKey,
                child: Column(
                  children: [
                    Text(
                      'سوف نقوم بإرسال رمز إلى الايميل الذي قمت بتسجيله لتغيير كلمة المرور',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AuthField(
                      controller: authCubit.forgetPasswordEmailSendController,
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
                    AuthReusableButton(
                      width: MediaQuery.sizeOf(context).width - 80,
                      label: 'إرسال الرمز',
                      onPressed: () {
                        if (forgetPasswordGlobalKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).forgetPassword();
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
