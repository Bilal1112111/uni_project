import 'package:flutter/material.dart';
import 'package:hello_world/utils/theme.dart';

import '../widgets/custom_sliver_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static String route = '/search_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().background,
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            CustomSliverAppBar(
              bottomLeft: 0.0,
              bottomRight: 0.0,
              title: Text(
                'قسم البحث ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 22, color: MaterialTheme.lightScheme().onPrimary),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SearchBar(
                    hintText: 'البحث عن طريق المنتج أو المتجر',
                    keyboardType: TextInputType.text,
                    surfaceTintColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                    constraints: const BoxConstraints(minHeight: 50.0),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                    leading: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                    hintStyle: WidgetStatePropertyAll(
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: MaterialTheme.lightScheme().background,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      const Color(0xFFB2BBCE).withOpacity(0.4),
                    ),
                    elevation: const WidgetStatePropertyAll(0.0),
                    overlayColor: WidgetStatePropertyAll(
                      MaterialTheme.lightScheme().secondary,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  TabBar(
                    labelColor: MaterialTheme.lightScheme().primary,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      const Tab(text: "المتاجر"),
                      const Tab(text: "العروض"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 100.0,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
