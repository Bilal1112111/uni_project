import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/theme.dart';

class CategoriesSlider extends StatelessWidget {
  CategoriesSlider({super.key});

  final List<String> categories = [
    "man",
    "woman",
    "child",
    "man",
    "woman",
    "child",
    "man",
    "woman",
    "child"
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: MaterialTheme.lightScheme().primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: TextStyle(
                    color: MaterialTheme.darkScheme().secondary, fontSize: 15),
              ),
            ),
          );
        },
      ),
    );
  }
}
