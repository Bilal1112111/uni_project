import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/category_cubit/category_states.dart';
import 'package:hello_world/business_logic/cubits/store_cubit/store_state.dart';
import 'package:hello_world/screens/categories_screen.dart';
import 'package:hello_world/screens/stores_screen.dart';
import 'package:hello_world/widgets/advertising_slider.dart';
import 'package:hello_world/widgets/archived_deals_grid.dart';
import 'package:hello_world/widgets/search_bar_button.dart';
import 'package:hello_world/widgets/stores_labeled_list_view.dart';

import '../business_logic/cubits/category_cubit/category_cubit.dart';
import '../business_logic/cubits/store_cubit/store_cubit.dart';
import '../utils/theme.dart';
import '../widgets/category_labeled_list_view.dart';
import '../widgets/custom_sliver_bar.dart';
import '../widgets/home_page_header.dart';
import '../widgets/list_view_label.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static String route = '/home_screen';
  List<DealsGrid> listOfDeals = [
    const DealsGrid(
        price: '100000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '100000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '100000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '100000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '100000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '100000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '100000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '100000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '100000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().background,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          CustomSliverAppBar(
            title: const HomePageHeader(),
            child: const Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                SearchBarButton(
                  label: 'البحث عن طريق المنتج أو المتجر',
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdvertisingSlider(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListViewLabel(
                    label: 'التصنيفات الأساسية',
                    onPressed: () async {
                      Navigator.pushNamed(context, CategoriesScreen.route);
                    },
                  ),
                  BlocBuilder<CategoriesCubit, CategoriesState>(
                    builder: (context, state) {
                      if (state is CategoriesLoadingState) {
                        return SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: MaterialTheme.lightScheme().primary,
                            ),
                          ),
                        );
                      } else if (state is CategoriesErrorState) {
                        return const SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text('something went wrong'),
                          ),
                        );
                      } else {
                        return CategoriesLabeledListView(
                          categories: BlocProvider.of<CategoriesCubit>(context)
                              .categories,
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ListViewLabel(
                    label: 'الفروع',
                    onPressed: () async {
                      Navigator.pushNamed(context, StoresScreen.route);
                    },
                  ),
                  BlocBuilder<StoreCubit, StoreState>(
                    builder: (context, state) {
                      if (state is ListVisibleStoreLoadingState) {
                        return SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: MaterialTheme.lightScheme().primary,
                            ),
                          ),
                        );
                      } else if (state is ListVisibleStoreErrorState) {
                        return const SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text('something went wrong'),
                          ),
                        );
                      } else {
                        return StoresLabeledListView(
                          stores: BlocProvider.of<StoreCubit>(context).stores,
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 12,
                            mainAxisExtent: 295),
                    itemCount: listOfDeals.length,
                    itemBuilder: (context, index) {
                      return listOfDeals[index];
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
