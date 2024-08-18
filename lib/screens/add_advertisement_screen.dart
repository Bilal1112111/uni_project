import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/advertisement_cubit/advertisement_cubit.dart';
import 'package:hello_world/business_logic/cubits/advertisement_cubit/advertisement_state.dart';
import 'package:hello_world/core/helpers/messages_helper.dart';
import 'package:hello_world/screens/authentication/widget/auth_field.dart';
import 'package:hello_world/screens/authentication/widget/auth_reusable_button.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/theme.dart';
import '../widgets/my_custom_app_bar.dart';

class AddAdvertisementScreen extends StatelessWidget {
  AddAdvertisementScreen({super.key});
  static String route = '/add_advertisement_screen';
  GlobalKey<FormState> addAdvertisementGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdvertisementCubit, AdvertisementState>(
      listener: (context, state) {
        if (state is AddAdvertisementErrorState) {
          showSnackBar(context, 'حدث خطأ ما', Colors.redAccent);
        } else if (state is AddAdvertisementSuccessState) {
          showSnackBar(context, 'تم إضافة الإعلان بنجاح', Colors.greenAccent);
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight + 20),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(25.0),
                bottomLeft: Radius.circular(25.0)),
            child: MyCustomAppBar(
              label: 'إضافة إعلان ',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: addAdvertisementGlobalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'لإضافة إعلان اتبع الخطوات التالية: ',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    BlocBuilder<AdvertisementCubit, AdvertisementState>(
                      builder: (context, state) {
                        var cubit = AdvertisementCubit.get(context);
                        return InkWell(
                          onTap: () async {
                            final newImage =
                                await cubit.pickImage(ImageSource.gallery);
                            cubit.selectImageChange(newImage!);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18.0),
                            child: BlocProvider.of<AdvertisementCubit>(context)
                                        .selectedImage ==
                                    null
                                ? Image.asset(
                                    'assets/images/image_place_holder.jpg',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 200.0,
                                  )
                                : Image.memory(
                                    BlocProvider.of<AdvertisementCubit>(context)
                                        .selectedImage!,
                                    width: double.infinity,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    AuthField(
                      controller: BlocProvider.of<AdvertisementCubit>(context)
                          .descriptionController,
                      keyboardType: TextInputType.multiline,
                      hintText: 'وصف الإعلان',
                      suffixIcon: Icons.description,
                      validator: (description) {
                        if (description!.isEmpty) {
                          return 'this field must be not empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    AuthField(
                      controller: BlocProvider.of<AdvertisementCubit>(context)
                          .phoneController,
                      keyboardType: TextInputType.phone,
                      hintText: 'هاتف التواصل',
                      suffixIcon: Icons.phone_android_rounded,
                      validator: (phone) {
                        if (phone!.isEmpty) {
                          return 'this field must be not empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    AuthField(
                      controller: BlocProvider.of<AdvertisementCubit>(context)
                          .periodController,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: false, decimal: false),
                      hintText: 'مدة الإعلان',
                      suffixIcon: Icons.timer,
                      validator: (period) {
                        if (period!.isEmpty) {
                          return 'this field must be not empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    BlocBuilder<AdvertisementCubit, AdvertisementState>(
                      builder: (context, state) {
                        if (state is AddAdvertisementLoadingState) {
                          return CircularProgressIndicator(
                            color: MaterialTheme.lightScheme().primary,
                          );
                        } else {
                          return AuthReusableButton(
                            width: double.infinity,
                            label: 'إضافة ',
                            onPressed: () {
                              if (addAdvertisementGlobalKey.currentState!
                                  .validate()) {
                                BlocProvider.of<AdvertisementCubit>(context)
                                    .addAdvertisement();
                              }
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
