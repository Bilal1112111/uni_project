import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/business_logic/cubits/store_cubit/store_cubit.dart';
import 'package:hello_world/business_logic/cubits/store_cubit/store_state.dart';
import 'package:hello_world/widgets/my_custom_app_bar.dart';

import '../utils/theme.dart';

class BranchScreen extends StatelessWidget {
  const BranchScreen({super.key});
  static String route = '/branch_screen';
  @override
  Widget build(BuildContext context) {
   StoreCubit cubit= StoreCubit.get(context);
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
     return  Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight + 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0)),
            child: MyCustomAppBar(
              label: 'الفرع',
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Image.asset(
                  'assets/images/product6.jpg',
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
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
                      'موقع الفرع',
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
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الفرع تابع للمتجر',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Leuschke, Reynolds and Predovic',
                                style: Theme.of(context).textTheme.titleLarge!,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'التقييم',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '5 نجوم',
                                style: Theme.of(context).textTheme.titleLarge!,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'قيم فرعنا',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.red,
                        ),
                        Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.red,
                        ),
                        Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.red,
                        ),
                        Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.red,
                        ),
                        Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            padding:
                                WidgetStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.all(5)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'إضافة إلى المفضلة',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: MaterialTheme.lightScheme().primary,
                                    fontSize: 20.0),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            padding:
                                WidgetStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.all(5)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'إضافة شكوى',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: MaterialTheme.lightScheme().primary,
                                    fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );}
    );
  }
}
