import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:hello_world/business_logic/cubits/auth_cubit/auth_state.dart';
import 'package:hello_world/core/helpers/messages_helper.dart';
import 'package:hello_world/screens/authentication/forget_password_screen.dart';
import 'package:hello_world/screens/authentication/widget/auth_reusable_button.dart';
import 'package:hello_world/screens/authentication/widget/otp.dart';
import 'package:hello_world/screens/home_screen.dart';

import '../../utils/theme.dart';
import '../../widgets/my_custom_app_bar.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});
  static String route = '/verification_screen';
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  final TextEditingController num3 = TextEditingController();
  final TextEditingController num4 = TextEditingController();
  GlobalKey<FormState> verifyFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final bool? con = args?['con'];
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is VerifyEmailSuccessState) {
          showSnackBar(context, 'تم توثيق حسابك', Colors.greenAccent);
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.route,
            (route) => false,
          );
        } else if (state is VerifyEmailErrorState) {
          showSnackBar(context, 'حدث خطأ ما', Colors.redAccent);
        } else if (state is ResendVerifyEmailSuccessState) {
          showSnackBar(context, 'تم إرسال الكود بنجاح', Colors.greenAccent);
        } else if (state is ResendVerifyEmailErrorState) {
          showSnackBar(context, 'حدث خطأ ما حاول مجددا', Colors.redAccent);
        } else if (state is ForgetPasswordCodeErrorState) {
          showSnackBar(context, 'حدث خطأ ما', Colors.redAccent);
        } else if (state is ForgetPasswordCodeSuccessState) {
          showSnackBar(context, 'رمز التحقق صحيح', Colors.greenAccent);
          Navigator.pushNamedAndRemoveUntil(
            context,
            ForgetPasswordScreen.route,
            (route) => false,
          );
        } else if (state is ForgetPasswordResendCodeSuccessState) {
          showSnackBar(context, 'تمت إعادة الإرسال بنجاح', Colors.greenAccent);
        } else if (state is ForgetPasswordResendCodeErrorState) {
          showSnackBar(context, 'حدث خطا ما', Colors.redAccent);
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
              label: 'رمز التحقق',
            ),
          ),
        ),
        backgroundColor: MaterialTheme.lightScheme().onPrimary,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22, vertical: 10.0),
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: verifyFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text(
                      'لقد شارفت على الوصول',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: MaterialTheme.lightScheme().onSurface,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text.rich(
                      const TextSpan(
                        text:
                            'أدخل الرمز المكون من 4 خانات الذي قد وصل على بريدك الالكتروني ',
                        children: <TextSpan>[
                          TextSpan(text: 'للتحقق'),
                        ],
                      ),
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: MaterialTheme.lightScheme().onSurface,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: OTP(
                        num1: num1,
                        num2: num2,
                        num3: num3,
                        num4: num4,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    AuthReusableButton(
                      label: 'تأكيد',
                      onPressed: () {
                        if (verifyFormKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).verifyEmail(
                              code:
                                  "${num1.text}${num2.text}${num3.text}${num4.text}");
                          if (con == false) {}
                          if (con == true) {
                            BlocProvider.of<AuthCubit>(context).forgetPasswordCode(
                                code:
                                    '${num1.text}${num2.text}${num3.text}${num4.text}');
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'لم يصل إليك رمز التحقق ؟ ',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color: MaterialTheme.lightScheme().onSurface,
                                ),
                          ),
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<AuthCubit>(context)
                                  .resendVerifyEmailCode();
                              if (con == false) {
                                print(
                                    '_____________________________________________________________');
                              }
                              if (con == true) {
                                BlocProvider.of<AuthCubit>(context)
                                    .resendForgetPasswordVerifyCode();
                              }
                            },
                            style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                  EdgeInsets.only(left: 10.0)),
                              overlayColor:
                                  WidgetStatePropertyAll(Colors.transparent),
                            ),
                            child: Text(
                              'إرسال مجددا',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color:
                                          MaterialTheme.lightScheme().primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        'طلب كود جديد خلال 0:30 ثانية',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: MaterialTheme.lightScheme().onSurface),
                      ),
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
