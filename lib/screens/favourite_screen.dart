import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/category_cubit/category_cubit.dart';
import 'package:hello_world/business_logic/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:hello_world/business_logic/cubits/favourite_cubit/favourite_states.dart';
import 'package:hello_world/widgets/my_custom_app_bar.dart';

import '../utils/theme.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({super.key});
  static String route = "/favorite_screen";
  List<String> imagePath = [
    'assets/images/product1.jpg',
    'assets/images/product2.png',
    'assets/images/product3.jpg',
    'assets/images/product4.jpeg',
    'assets/images/product5.jpeg',
    'assets/images/product6.jpg',
    'assets/images/product1.jpg',
    'assets/images/product2.png',
    'assets/images/product3.jpg',
    'assets/images/product4.jpeg',
    'assets/images/product5.jpeg',
    'assets/images/product6.jpg',
    'assets/images/product5.jpeg',
    'assets/images/product6.jpg',
  ];
  List<String> categories = [
    "البسة",
    "مواد غذائية",
    "كهربائيات",
    "البسة",
    "مواد غذائية",
    "كهربائيات",
    "البسة",
    "مواد غذائية",
    "كهربائيات",
    "البسة",
    "مواد غذائية",
    "كهربائيات",
    "مواد غذائية",
    "كهربائيات"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight + 20),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0)),
          child: MyCustomAppBar(
            label: 'المفضلة',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
          ),
          child: BlocBuilder<FavouriteCubit, FavouriteState>(
            builder: (context, state) {
              if (state is GetAllFavouritesLoadingState) {
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: MaterialTheme.lightScheme().primary,
                    ),
                  ),
                );
              } else if (state is GetAllFavouritesErrorState) {
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: MaterialTheme.lightScheme().primary,
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 12,
                              mainAxisExtent: 150),
                      itemCount: BlocProvider.of<CategoriesCubit>(context)
                          .categories
                          .length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: 154,
                              decoration: BoxDecoration(
                                color: Color(0xFFB2BBCE).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18.0),
                                  child: Image.asset(
                                    imagePath[index],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 100,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              BlocProvider.of<CategoriesCubit>(context)
                                  .categories[index]
                                  .category,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                      color: const Color(0xFF616A7D),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
