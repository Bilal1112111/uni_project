import 'package:flutter/material.dart';

import '../utils/theme.dart';

class SettingListItem extends StatelessWidget {
  const SettingListItem(
      {super.key,
      required this.label,
      required this.icon,
      required this.onTap});
  final String label;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xFFB2BBCE).withOpacity(.1),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: MaterialTheme.lightScheme().primary,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.grey.withOpacity(.8),
                  ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_right,
              color: MaterialTheme.lightScheme().primary,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
