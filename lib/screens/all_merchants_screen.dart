import 'package:flutter/material.dart';

import '../widgets/my_custom_app_bar.dart';

class AllMerchantsScreen extends StatelessWidget {
  const AllMerchantsScreen({super.key});
  static String route = '/all_merchants_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight + 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0)),
          child: MyCustomAppBar(
            label: 'قائمة التجار',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(18.0),
            //   child: Image.asset(
            //     'assets/images/product6.jpg',
            //     width: double.infinity,
            //     height: 200.0,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => MerchantListItem(),
                separatorBuilder: (context, index) => SizedBox(
                      height: 12.0,
                    ),
                itemCount: 10),
          ],
        ),
      ),
    );
  }
}

class MerchantListItem extends StatelessWidget {
  const MerchantListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: const Color(0xFFB2BBCE).withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 30.0,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اسم التاجر: Bilal Alrefaie',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                ' رقم الموبايل: +1-458-433-0822',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 14.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                'البريد الالكتروني: Bilal Alrefaie@gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 14.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
