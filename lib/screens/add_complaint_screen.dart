import 'package:flutter/material.dart';
import 'package:hello_world/screens/authentication/widget/auth_field.dart';
import 'package:hello_world/screens/authentication/widget/auth_reusable_button.dart';

import '../utils/theme.dart';
import '../widgets/my_custom_app_bar.dart';

class AddComplaintScreen extends StatelessWidget {
  const AddComplaintScreen({super.key});
  static String route = '/add_complaint_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().background,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight + 20),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0)),
          child: MyCustomAppBar(
            label: 'إضافة شكوى',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'لإضافة شكوى على متجر ما اتبع الخطوات: ',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20.0,
              ),
              AuthField(
                keyboardType: TextInputType.multiline,
                controller: TextEditingController(),
                suffixIcon: Icons.add_comment_rounded,
                hintText: 'الشكوى ',
                validator: (complain) {
                  if (complain!.isEmpty) {
                    return 'this field must be not empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              AuthReusableButton(
                width: MediaQuery.of(context).size.width - 100,
                onPressed: () {},
                label: 'إضافة',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
