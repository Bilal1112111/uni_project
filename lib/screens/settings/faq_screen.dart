import 'package:flutter/material.dart';

import '../../utils/theme.dart';
import '../../widgets/my_custom_app_bar.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});
  static String route = "/faq_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().primary,
      appBar: PreferredSize(
        preferredSize:
            Size(double.infinity, MediaQuery.of(context).size.height * 0.09),
        child: MyCustomAppBar(
          label: 'سياسة الخصوصية',
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 5.0),
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
          top: 40.0,
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: MaterialTheme.lightScheme().onPrimary,
          boxShadow: [
            BoxShadow(
                color: MaterialTheme.lightScheme().shadow,
                blurStyle: BlurStyle.outer,
                spreadRadius: 0,
                blurRadius: 7.0),
          ],
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(75.0), topLeft: Radius.circular(75.0)),
        ),
        child: SingleChildScrollView(
          child: Text(
            '',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
