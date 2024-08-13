import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/store_cubit/store_cubit.dart';
import 'package:hello_world/screens/store_details.dart';
import 'package:hello_world/widgets/my_custom_app_bar.dart';

import '../utils/theme.dart';

class StoresScreen extends StatelessWidget {
  StoresScreen({super.key});
  static String route = "/stores_screen";
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
    "أديداس",
    "ديادورا",
    "تاليس",
    "لاكوست",
    "400",
    "كازوتشي",
    "زارا",
    "بوما",
    "ريبوك",
    "بزورية الكردي",
    "تارغيت",
    "لوردرية",
    "فيكس 8",
    "نيو لابتوب"
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
            label: 'المتاجر',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 150),
                itemCount: BlocProvider.of<StoreCubit>(context).stores.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, StoreDetails.route);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 154,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB2BBCE).withOpacity(0.1),
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
                          BlocProvider.of<StoreCubit>(context)
                              .stores[index]
                              .name,
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
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
