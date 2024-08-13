import 'package:flutter/material.dart';

import '../utils/theme.dart';

class MyCustomAppBar extends StatelessWidget {
  MyCustomAppBar({super.key, required this.label, this.centerTitle = true});
  final String label;
  bool centerTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 0.0,
      backgroundColor: MaterialTheme.lightScheme().primary,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: MaterialTheme.lightScheme().onPrimary,
        ),
      ),
      centerTitle: centerTitle,
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: MaterialTheme.lightScheme().onPrimary,
              fontSize: 28.0,
            ),
      ),
      toolbarHeight: MediaQuery.of(context).size.height * 0.09,
    );
  }
}
