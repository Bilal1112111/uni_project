import 'package:flutter/material.dart';

import '../utils/theme.dart';
import '../widgets/expandable_text.dart';

class ListOfComments extends StatelessWidget {
  const ListOfComments({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Bilal Al Refaie',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MaterialTheme.lightScheme().primary,
                        ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'This product is very good..',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                  ),
                  ExpandableText(
                      'Hello i bought this product from apple store and it was amazing and affordable, and it was perfect, soft, and have a nice treatment and good,'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
