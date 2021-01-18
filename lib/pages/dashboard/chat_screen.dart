import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final theme = Theme.of(context);

    return Scaffold(
        body: OrixPetBackground(
            colors: [
          Color(0xff9CFCD7),
          Color(0xffFEE499),
          Color(0xffFCCAAC),
          Color(0xffA1EDF9)
        ],
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: ChatSliverDelegate(
                          expandedHeight: 165,
                          appBarPadding:
                              const EdgeInsets.fromLTRB(8, 14, 14, 14),
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
                            itemBuilder: (ctx, i) => i % 2 == 0
                                ? ChatTile.received('Really!')
                                : ChatTile.sent(
                                    'It\'s Sapphire. I wanted to adopet Sia.'),
                            itemCount: 32)),
                  ]),
                ),

                ///Enter message section
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 8, 18, 18),
                  child: Row(
                    children: [
                      RawMaterialButton(
                        onPressed: () {},
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                        fillColor: Colors.amber,
                        elevation: 1,
                        constraints: const BoxConstraints.tightFor(
                            width: 48, height: 48),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                          child: Material(
                        color: Colors.white,
                        shape: const StadiumBorder(),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Write a message',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(18, 8, 8, 8)),
                            )),
                            RawMaterialButton(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onPressed: () {},
                              shape: const CircleBorder(),
                              child: SvgPicture.asset(
                                'assets/icons/send.svg',
                                color: Colors.white,
                                height: 24,
                              ),
                              fillColor: theme.primaryColor,
                              elevation: 1,
                              constraints: const BoxConstraints.tightFor(
                                  width: 48, height: 48),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                )
              ],
            )));
  }
}

class ChatTile extends StatelessWidget {
  final bool isSent;
  final String text;
  ChatTile.sent(this.text) : isSent = true;
  ChatTile.received(this.text) : isSent = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 21),
        constraints: BoxConstraints(maxWidth: width / 1.7),
        decoration: BoxDecoration(
            color: isSent ? Colors.white : Color(0xffFEE5E5),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              topLeft: Radius.circular(isSent ? 12 : 0),
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(isSent ? 0 : 12),
            )),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
