import 'package:flutter/material.dart';
import 'package:orix_pet/pages/dashboard/widgets/chat_header.dart';
import 'package:orix_pet/pages/dashboard/widgets/pet_sliver_delegate.dart';
import 'package:orix_pet/widgets/orix_pet_background.dart';

import 'messages_screen.dart';

///
/// Created by Sunil Kumar on 08-12-2020 09:23 PM.
///
class ChatScreen extends StatelessWidget {
  static const routeName = '/ChatScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrixPetBackground(
          colors: [Colors.green, Colors.yellow, Colors.purple, Colors.blue],
          child: CustomScrollView(slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: ChatSliverDelegate(
                  expandedHeight: 165,
                  appBarPadding: const EdgeInsets.fromLTRB(8, 14, 14, 14),
                  leading: Material(
                      type: MaterialType.circle,
                      color: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      child: BackButton()),
                  title: Text('Messaging')),
            ),
            SliverToBoxAdapter(
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctx, i) => MessageUserTile(),
                    itemCount: 32)),
          ])),
    );
  }
}
