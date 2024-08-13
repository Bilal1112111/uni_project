import 'package:flutter/material.dart';

import '../utils/theme.dart';

class DealsGrid extends StatelessWidget {
  const DealsGrid({
    super.key,
    required this.price,
    required this.productDeals,
  });
  final String price;
  final String productDeals;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xFFB2BBCE).withOpacity(.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    child: ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "assets/images/product6.jpg",
                        fit: BoxFit.cover,
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Adidas',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              // borderRadius: BorderRadius.circular(18),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0),
              ),
              child: Image.asset(
                "assets/images/product1.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 100,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    price,
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    productDeals,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: Color(0xFF616A7D), fontSize: 12.0),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'رؤية المزيد',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: MaterialTheme.lightScheme().primary,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
