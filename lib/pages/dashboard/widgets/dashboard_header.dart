import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orix_pet/pages/dashboard/pet_category_screen.dart';

import '../dashboard_screen.dart';

///
/// Created by Sunil Kumar on 26-11-2020 11:42 PM.
///

class DashboardSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  DashboardSliverDelegate({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    final theme = Theme.of(context);
    return Container(
        height: expandedHeight,
        color: theme.scaffoldBackgroundColor,
        child: Stack(children: [
          ///bottom
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Opacity(
                opacity: percent,
                child: Container(
                    height: 64,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) => CategoryCard(),
                        itemCount: 12)),
              )),

          ///app bar
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: expandedHeight - 96,
                padding: const EdgeInsets.fromLTRB(22, 14, 14, 14),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(22)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: Offset(0, 1),
                          spreadRadius: 1)
                    ]),
                child: SafeArea(
                  child: Row(
                    children: [
                      Image.asset('assets/icons/logo.png',
                          height: 42, width: 42),
                      SizedBox(width: 6),
                      Text(
                        'Orix Pet',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                      Spacer(),
                      Material(
                        type: MaterialType.circle,
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/icons/menu.svg'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          ///search
          Positioned(
            top: 100 * percent,
            left: 16,
            right: 16,
            child: Opacity(
              opacity: percent,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(42),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                          spreadRadius: 0)
                    ]),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 21, right: 8),
                      child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Search')),
                    )),
                    Material(
                      type: MaterialType.circle,
                      color: theme.primaryColor,
                      child: InkWell(
                        onTap: () {},
                        customBorder: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child:
                              Icon(Icons.search_rounded, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, PetCategoryScreen.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://img.freepik.com/free-vector/adopt-pet-with-woman-dog_23-2148511804.jpg?size=338&ext=jpg'))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Pet Adoption',
                      style: TextStyle(fontWeight: FontWeight.w800)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
