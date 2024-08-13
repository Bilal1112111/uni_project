import 'package:flutter/material.dart';

import '../utils/theme.dart';

class CustomProductsAppBar extends StatefulWidget {
  const CustomProductsAppBar(
      {super.key, required this.title, required this.isStore});

  @override
  State<CustomProductsAppBar> createState() => _CustomProductsAppBarState();
  final String title;
  final bool isStore;
}

class _CustomProductsAppBarState extends State<CustomProductsAppBar> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 100,
      backgroundColor: MaterialTheme.lightScheme().primary,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_outlined,
          color: MaterialTheme.lightScheme().background,
        ),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            child: ClipOval(
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/images/product3.jpg',
                fit: BoxFit.cover,
                height: 70,
                width: 70,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: MaterialTheme.lightScheme().background,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              isActive = !isActive;
            });
          },
          icon: Icon(
            isActive == true
                ? Icons.favorite_outlined
                : Icons.favorite_outline_rounded,
            color: isActive == true
                ? Colors.redAccent
                : MaterialTheme.lightScheme().background,
          ),
        ),
        Visibility(
          visible: widget.isStore,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.info_rounded,
              color: MaterialTheme.lightScheme().background,
            ),
          ),
        ),
      ],
    );
  }
}
