import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class ReusableAlternativeAuthWay extends StatelessWidget {
  const ReusableAlternativeAuthWay({
    super.key,
    required this.ask,
    required this.alternativeWayText,
    required this.routeName,
  });
  final String ask;
  final String alternativeWayText;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(ask,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: MaterialTheme.lightScheme().onSurface,
                  fontWeight: FontWeight.w600,
                )),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, routeName);
          },
          child: Text(
            alternativeWayText,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: MaterialTheme.lightScheme().primary.withOpacity(0.8),
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ],
    );
  }
}
