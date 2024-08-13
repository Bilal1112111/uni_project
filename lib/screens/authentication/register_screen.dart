import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/core/helpers/messages_helper.dart';
import 'package:hello_world/screens/authentication/verify_email_screen.dart';
import 'package:hello_world/screens/authentication/widget/auth_field.dart';
import 'package:hello_world/screens/authentication/widget/auth_reusable_button.dart';
import 'package:hello_world/screens/authentication/widget/reusable_alt_auth.dart';
import 'package:hello_world/screens/authentication/widget/reusable_option_box.dart';
import 'package:image_picker/image_picker.dart';

import '../../business_logic/cubits/auth_cubit/auth_cubit.dart';
import '../../business_logic/cubits/auth_cubit/auth_state.dart';
import '../../utils/theme.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static String route = '/register_screen';
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          showSnackBar(context, 'تم تسحيل حسابك بنجاح', Colors.greenAccent);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyEmailScreen(),
              ),
              (d) => false);
        } else if (state is RegisterErrorState) {
          showSnackBar(context, 'حدث خطأ ما', Colors.redAccent);
        }
      },
      child: Scaffold(
        backgroundColor: MaterialTheme.lightScheme().onPrimary,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(30.0),
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: registerFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'هيا لنبدأ',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: MaterialTheme.lightScheme().onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Text(
                      'بإنشاء حساب مجاني جديد',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: MaterialTheme.lightScheme().onSurface,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        var cubit = AuthCubit.get(context);
                        return InkWell(
                          onTap: () async {
                            final newImage =
                                await cubit.pickImage(ImageSource.gallery);
                            cubit.selectImageChange(newImage!);
                          },
                          child: ClipOval(
                            child: BlocProvider.of<AuthCubit>(context)
                                        .selectedImage ==
                                    null
                                ? Image.asset(
                                    'assets/images/product3.jpg',
                                    fit: BoxFit.cover,
                                    width: 100.0,
                                    height: 100.0,
                                  )
                                : Image.memory(
                                    BlocProvider.of<AuthCubit>(context)
                                        .selectedImage!,
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return AuthField(
                            controller: BlocProvider.of<AuthCubit>(context)
                                .textEditingControllersList[index],
                            keyboardType: BlocProvider.of<AuthCubit>(context)
                                .inputTypeList[index],
                            hintText: BlocProvider.of<AuthCubit>(context)
                                .labelsList[index],
                            suffixIcon: BlocProvider.of<AuthCubit>(context)
                                .iconsList[index],
                            isPassword: BlocProvider.of<AuthCubit>(context)
                                .visibleList[index],
                            validator: (value) =>
                                BlocProvider.of<AuthCubit>(context).validate(
                                    BlocProvider.of<AuthCubit>(context)
                                        .labelsList[index]),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20.0,
                            ),
                        itemCount: 7),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BlocBuilder<AuthCubit, AuthStates>(
                          builder: (context, state) {
                            return ReusableOptionBox(
                                value: BlocProvider.of<AuthCubit>(context)
                                    .checkBoxValue,
                                onChanged: (value) {
                                  BlocProvider.of<AuthCubit>(context)
                                      .changeCheckBoxValue();
                                });
                          },
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'من خلال تحديد المربع فإنك توافق على ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color: MaterialTheme.lightScheme().onSurface,
                                  fontSize: 12,
                                ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'الأحكام ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: MaterialTheme.lightScheme()
                                            .surfaceTint,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                              ),
                              const TextSpan(text: 'و '),
                              TextSpan(
                                text: 'الشروط',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: MaterialTheme.lightScheme()
                                          .surfaceTint,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    AuthReusableButton(
                      onPressed: () {
                        if (registerFormKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).register();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ReusableAlternativeAuthWay(
                      ask: 'لديك حساب؟',
                      alternativeWayText: 'تسجيل الدخول',
                      routeName: LoginScreen.route,
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
