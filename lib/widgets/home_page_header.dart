import 'package:flutter/material.dart';
import 'package:hello_world/utils/theme.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          ' مرحباًً, بلال',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 22,
                color: MaterialTheme.lightScheme().onPrimary,
              ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_active_rounded,
            color: MaterialTheme.lightScheme().onPrimary,
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.qr_code_scanner_rounded,
            color: MaterialTheme.lightScheme().onPrimary,
          ),
        ),
      ],
    );
  }
}
