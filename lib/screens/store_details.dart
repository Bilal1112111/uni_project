import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/widgets/my_custom_app_bar.dart';

import '../business_logic/cubits/store_cubit/store_cubit.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails({super.key});
  static String route = "/store_details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight + 20),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0)),
          child: MyCustomAppBar(
            label: BlocProvider.of<StoreCubit>(context).stores[2].name,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: const Color(0xFFB2BBCE).withOpacity(0.2),
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
                BlocProvider.of<StoreCubit>(context).stores[2].description,
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
                BlocProvider.of<StoreCubit>(context).stores[2].merchant,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
