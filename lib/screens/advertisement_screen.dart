import 'package:flutter/material.dart';

import '../utils/theme.dart';
import '../widgets/my_custom_app_bar.dart';

class AdvertisementScreen extends StatelessWidget {
  const AdvertisementScreen({super.key});
  static String route = '/advertisement_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().background,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight + 20),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0)),
          child: MyCustomAppBar(
            label: 'تفاصيل الإعلان',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Image.asset(
                  'assets/images/product6.jpg',
                  width: double.infinity,
                  height: 250.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: const Color(0xFFB2BBCE).withOpacity(0.1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'وصف الإعلان',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'إعلان لشركة سيارات لزيادة المبيعات و الدخول إلى السوق بقوة و منافسة ',
                      style: Theme.of(context).textTheme.titleLarge!,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              'صاحب الإعلان',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'بلال الأحمد',
                              style: Theme.of(context).textTheme.titleLarge!,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              'هاتف التواصل',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '0959871726',
                              style: Theme.of(context).textTheme.titleLarge!,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
