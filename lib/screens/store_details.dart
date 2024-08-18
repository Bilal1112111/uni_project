import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/widgets/my_custom_app_bar.dart';

import '../business_logic/cubits/store_cubit/store_cubit.dart';
import '../utils/theme.dart';
import '../widgets/archived_deals_grid.dart';

class StoreDetails extends StatelessWidget {
  StoreDetails({super.key});
  static String route = "/store_details";
  bool isFav = true;
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
    final int storeId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight + 10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0)),
          child: MyCustomAppBar(
            label: BlocProvider.of<StoreCubit>(context).stores[storeId].name,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: const Color(0xFFB2BBCE).withOpacity(.1),
                  borderRadius: BorderRadius.circular(25.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'معلومات عن المتجر',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    BlocProvider.of<StoreCubit>(context)
                        .stores[storeId]
                        .description,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 20.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'صاحب المتجر',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    BlocProvider.of<StoreCubit>(context)
                        .stores[storeId]
                        .merchant,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: MaterialTheme.lightScheme().primary,
              ),
              child: Text(
                textAlign: TextAlign.center,
                'فروع المتجر',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
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
    );
  }
}
