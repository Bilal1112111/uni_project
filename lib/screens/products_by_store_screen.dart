import 'package:flutter/material.dart';

import '../widgets/archived_deals_grid.dart';
import '../widgets/custom_product_app_bar.dart';

class ProductsByStoreScreen extends StatelessWidget {
  ProductsByStoreScreen({super.key});
  static String route = '/products_by_store_screen';
  List<DealsGrid> listOfDeals = [
    const DealsGrid(
        price: '120000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '1455000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '200000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '564000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '603300 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '990000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
    const DealsGrid(
        price: '1090000 SYP',
        productDeals: 'عرض اليوم على البسة الاطفال من خمس سنين حتى العشر سنين'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 90.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35.0),
            bottomRight: Radius.circular(35.0),
          ),
          child: CustomProductsAppBar(
            isStore: true,
            title: 'Adidas',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
