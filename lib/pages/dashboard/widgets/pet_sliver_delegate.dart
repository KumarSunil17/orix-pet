import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orix_pet/pages/dashboard/pet_category_screen.dart';

import '../dashboard_screen.dart';

///
/// Created by Sunil Kumar on 07-12-2020 07:36 PM.
///
class PetSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Widget bottom;
  final Widget title;
  final Widget leading;
  final Widget trailing;

  final EdgeInsets appBarPadding;
  PetSliverDelegate(
      {@required this.expandedHeight,
      this.bottom,
      this.title,
      this.leading,
      this.trailing,
      this.appBarPadding});

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
          if (bottom != null)
            Positioned(left: 0, right: 0, bottom: 0, child: bottom),

          ///app bar
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: expandedHeight,
                padding:
                    appBarPadding ?? const EdgeInsets.fromLTRB(14, 14, 14, 14),
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          if (leading == null)
                            Image.asset('assets/icons/logo.png',
                                height: 42, width: 42)
                          else
                            leading,
                          SizedBox(width: 6),
                          DefaultTextStyle(
                            style: theme.textTheme.headline6.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w800),
                            child: title == null
                                ? Text(
                                    'Orix Pet',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  )
                                : title,
                          ),
                          Spacer(),
                          if (trailing == null)
                            Material(
                              type: MaterialType.circle,
                              color: Colors.transparent,
                              clipBehavior: Clip.antiAlias,
                              child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.string(
                                    '''<svg xmlns="http://www.w3.org/2000/svg" width="18" height="12.5" viewBox="0 0 18 12.5">
  <g id="Group_9" data-name="Group 9" transform="translate(1008 -663)">
      <rect id="Rectangle_9" data-name="Rectangle 9" width="18" height="2.5" rx="1.25" transform="translate(-1008 668)" fill="#101010"/>
      <rect id="Rectangle_10" data-name="Rectangle 10" width="7" height="2.5" rx="1.25" transform="translate(-997 663)" fill="#101010"/>
      <rect id="Rectangle_11" data-name="Rectangle 11" width="7" height="2.5" rx="1.25" transform="translate(-1008 673)" fill="#101010"/>
  </g>
</svg>

'''),
                              ),
                            )
                          else
                            trailing
                        ],
                      ),
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
                          color: Colors.grey[100],
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
    return true;
  }
}
