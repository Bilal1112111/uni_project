import 'package:flutter/material.dart';

import '../data/models/category_model.dart';

class CategoriesLabeledListView extends StatelessWidget {
  CategoriesLabeledListView({
    super.key,
    required this.categories,
  });
  final List<CategoryModel> categories;

  List<String> imagePaths = [
    'assets/images/product1.jpg',
    'assets/images/product2.png',
    'assets/images/product3.jpg',
    'assets/images/product4.jpeg',
    'assets/images/product5.jpeg',
    'assets/images/product6.jpg',
    'assets/images/product6.jpg',
    'assets/images/product3.jpg',
    'assets/images/product4.jpeg',
    'assets/images/product5.jpeg',
    'assets/images/product6.jpg',
    'assets/images/product6.jpg',
    'assets/images/product3.jpg',
    'assets/images/product4.jpeg',
    'assets/images/product5.jpeg',
    'assets/images/product6.jpg',
    'assets/images/product6.jpg',
    'assets/images/product3.jpg',
    'assets/images/product4.jpeg',
    'assets/images/product5.jpeg',
    'assets/images/product6.jpg',
    'assets/images/product6.jpg',
    'assets/images/product3.jpg',
    'assets/images/product4.jpeg',
    'assets/images/product5.jpeg',
    'assets/images/product6.jpg',
    'assets/images/product6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 90.0,
          width: double.infinity,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(),
                  width: 40,
                  height: 20,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    categories[index].category,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10.0,
            ),
            itemCount: (categories.length / 2).toInt() + 1,
          ),
        ),
      ],
    );
  }
}
