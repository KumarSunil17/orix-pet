import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:orix_pet/pages/dashboard/settings_screen.dart';
import 'package:orix_pet/pages/dashboard/widgets/dashboard_bottom_nav.dart';
import 'package:orix_pet/pages/post/widgets/post_card.dart';
import 'package:orix_pet/widgets/orix_tab_indicator.dart';

import 'widgets/pet_app_bar.dart';
import 'widgets/pet_sliver_delegate.dart';

///
/// Created by Sunil Kumar on 10-12-2020 11:41 AM.
///
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(slivers: [
      SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: ProfileSliverDelegate(tabController: _tabController),
      ),
      SliverToBoxAdapter(child: Builder(
        builder: (context) {
          final current = _tabController.index;
          if (current == 0) {
            return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, i) => PetPostCard(),
                itemCount: 32);
          } else if (current == 1) {
            return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, i) => PetPostCard(),
                itemCount: 32);
          } else {
            return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, i) => PetPostCard(),
                itemCount: 32);
          }
        },
      )),
    ]);
  }
}

class ProfileSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight = 340;
  final TabController tabController;
  ProfileSliverDelegate({this.tabController});

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
              top: 0,
              child: Container(
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
                  child: SingleChildScrollView(
                    reverse: true,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(NumberFormat.compact().format(407),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18)),
                                    Text('Following',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey)),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 48,
                                  backgroundImage: NetworkImage(
                                      'https://img.freepik.com/free-photo/girl_23-2148168226.jpg?size=338&ext=jpg'),
                                ),
                                Column(children: [
                                  Text(NumberFormat.compact().format(14500),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                  Text('Following',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey)),
                                ])
                              ]),
                          SizedBox(height: 16),
                          Text('Esther Howard',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w600)),
                          Text('Pet owner',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 12),
                          TabBar(
                              controller: tabController,
                              tabs: [
                                Tab(text: 'Post'),
                                Tab(text: 'Save'),
                                Tab(text: 'About'),
                              ],
                              unselectedLabelStyle:
                                  TextStyle(fontWeight: FontWeight.w600),
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.w600),
                              unselectedLabelColor: Colors.grey,
                              labelColor: Colors.black,
                              indicator: OrixTabIndicator())
                        ]),
                  ))),

          ///app bar
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: PetAppBar(
                elevation: 15 * percent,
                title: Text("Profile"),
                leading: Material(
                    type: MaterialType.circle,
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    child: BackButton(
                      onPressed: () {
                        bottomNavCurrentIndex.value = 0;
                      },
                    )),
                trailing: Material(
                  type: MaterialType.circle,
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SettingsScreen.routeName);
                      },
                      icon: Icon(Icons.settings_rounded)),
                ),
              ),
            ),
          ),
        ]));
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
