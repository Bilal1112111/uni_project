import 'package:flutter/material.dart';
import 'package:hello_world/utils/theme.dart';

import '../screens/search_screen.dart';

class SearchBarButton extends StatelessWidget {
  const SearchBarButton({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFB2BBCE).withOpacity(0.3),
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        overlayColor:
            WidgetStatePropertyAll(MaterialTheme.lightScheme().secondary),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.search_rounded,
              size: 26,
              color: MaterialTheme.lightScheme().background,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: MaterialTheme.lightScheme().background,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, SearchScreen.route);
        },
      ),
    );
  }
}
