import 'package:flutter/material.dart';
import 'package:orix_pet/pages/dashboard/widgets/dashboard_header.dart';
import 'package:orix_pet/pages/post/widgets/post_card.dart';

///
/// Created by Sunil Kumar on 08-12-2020 10:43 AM.
///
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: DashboardSliverDelegate(
          expandedHeight: 260,
        ),
      ),
      SliverToBoxAdapter(
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, i) => PetPostCard(),
              itemCount: 32)),
    ]);
  }
}
