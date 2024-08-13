import 'package:flutter/material.dart';
import 'package:hello_world/widgets/archived_deals_grid.dart';
import 'package:hello_world/widgets/my_custom_app_bar.dart';

class ArchivedScreen extends StatelessWidget {
  ArchivedScreen({super.key});
  static String route = "/archive";
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
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight + 20),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0)),
          child: MyCustomAppBar(
            label: 'الأرشيف',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
