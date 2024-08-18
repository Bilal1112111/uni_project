import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/store_cubit/store_cubit.dart';
import 'package:hello_world/business_logic/cubits/store_cubit/store_state.dart';
import 'package:hello_world/core/helpers/messages_helper.dart';
import 'package:hello_world/screens/store_details.dart';

import '../data/models/store_model.dart';

class StoresLabeledListView extends StatelessWidget {
  StoresLabeledListView({
    super.key,
    required this.stores,
  });
  final List<StoreModel> stores;

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
    return BlocListener<StoreCubit, StoreState>(
      listener: (context, state) {
        if (state is ShowStoreByIdErrorState) {
          showSnackBar(context, 'حدث خطأ ما', Colors.redAccent);
        }
      },
      child: Column(
        children: [
          SizedBox(
            height: 90.0,
            width: double.infinity,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  // BlocProvider.of<StoreCubit>(context)
                  //     .showStoreById(stores[index].id.toString());
                  Navigator.pushNamed(context, StoreDetails.route,
                      arguments: index);
                },
                child: Column(
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
                      width: 60,
                      height: 20,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        stores[index].name,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                width: 10.0,
              ),
              itemCount: (stores.length / 2).toInt() + 1,
            ),
          ),
        ],
      ),
    );
  }
}
