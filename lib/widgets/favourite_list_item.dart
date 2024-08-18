import 'package:flutter/material.dart';

class FavouriteStoresListItem extends StatelessWidget {
  const FavouriteStoresListItem({
    super.key,
    required this.count,
  });
  final String count;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: const Color(0xFFB2BBCE).withOpacity(0.1),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            child: Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(
                count,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'متجر السعادة',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'صاحب المتجر: أحمد محمود',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.favorite_rounded,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
