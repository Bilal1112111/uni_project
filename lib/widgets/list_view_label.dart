import 'package:flutter/material.dart';

import '../utils/theme.dart';

class ListViewLabel extends StatelessWidget {
  const ListViewLabel({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size(20, 20),
              maximumSize: const Size(60, 50),
              backgroundColor:
                  MaterialTheme.lightScheme().primary.withOpacity(.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              'المزيد',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: MaterialTheme.lightScheme().primary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
