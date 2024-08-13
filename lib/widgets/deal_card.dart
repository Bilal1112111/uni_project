import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../utils/theme.dart';

// ignore: must_be_immutable
class DealCard extends StatelessWidget {
  static String route = '/';
  double priceAfter;
  double priceBefore;
  bool gift;
  String explanation;
  String image;
  VoidCallback onViewMore;

  DealCard(
      {super.key,
      required this.priceAfter,
      required this.priceBefore,
      this.gift = false,
      required this.explanation,
      required this.image,
      required this.onViewMore});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 12, left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          priceBefore.toString(),
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.red,
                            decorationThickness: 2,
                            color: MaterialTheme.lightScheme().onBackground,
                          ),
                        ),
                        Text(
                          priceAfter.toString(),
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      explanation,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    GestureDetector(
                      onTap: onViewMore,
                      child: Text(
                        S.of(context).viewmore,
                        style: TextStyle(
                          color: MaterialTheme.lightScheme().primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
