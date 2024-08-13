import 'package:flutter/material.dart';

import '../utils/theme.dart';

class CustomSliverAppBar extends StatelessWidget {
  CustomSliverAppBar({
    super.key,
    required this.child,
    this.actions,
    this.bottom,
    this.bottomRight = 25.0,
    this.bottomLeft = 25.0,
    required this.title,
  });
  final Widget child;
  final Widget title;
  final List<Widget>? actions;
  PreferredSizeWidget? bottom;
  double bottomLeft;
  double bottomRight;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      bottom: bottom,
      actions: actions,
      title: title,
      pinned: true,
      automaticallyImplyLeading: false,
      expandedHeight: 100 * 1.8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        ),
      ),
      backgroundColor: MaterialTheme.lightScheme().primary,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 16,
                    top: 50,
                  ),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
