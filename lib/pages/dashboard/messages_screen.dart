import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:orix_pet/pages/dashboard/chat_screen.dart';
import 'package:orix_pet/pages/dashboard/widgets/dashboard_header.dart';

import 'widgets/pet_sliver_delegate.dart';

///
/// Created by Sunil Kumar on 08-12-2020 10:47 AM.
///
class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(slivers: [
      SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: PetSliverDelegate(
            expandedHeight: 260,
            appBarPadding: const EdgeInsets.fromLTRB(8, 14, 14, 14),
            leading: Material(
                type: MaterialType.circle,
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                child: BackButton()),
            title: Text('Message'),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 100),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(18, 12, 18, 4),
                children: [
                  MessageStoryWidget(
                      text: 'Add',
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Icon(Icons.add, color: theme.primaryColor),
                      )),
                  ...List.generate(
                      20,
                      (index) => MessageStoryWidget(
                            text: 'Sam',
                            child: Image.network(
                              'https://images.unsplash.com/photo-1505628346881-b72b27e84530?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjR8fGRvZ3xlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=100&q=60',
                              fit: BoxFit.cover,
                              height: 54,
                              width: 54,
                            ),
                          ))
                ],
              ),
            )),
      ),
      SliverToBoxAdapter(
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, i) => i % 2 == 0
                  ? MessageUserTile.online()
                  : MessageUserTile.offline(),
              itemCount: 32)),
    ]);
  }
}

class MessageStoryWidget extends StatelessWidget {
  final Widget child;
  final String text;
  final VoidCallback? onPressed;
  const MessageStoryWidget({required this.child, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Material(
                type: MaterialType.circle,
                color: Colors.white,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  child: child,
                  onTap: onPressed,
                )),
          ),
          SizedBox(height: 4),
          Text(text,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12))
        ],
      ),
    );
  }
}

class MessageUserTile extends StatelessWidget {
  final bool online;

  MessageUserTile.online() : this.online = true;
  MessageUserTile.offline() : this.online = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ChatScreen.routeName);
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.fromLTRB(21, 8, 21, 8),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                  spreadRadius: 0)
            ],
            borderRadius: BorderRadius.all(Radius.circular(12))),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/girl_23-2148168226.jpg?size=338&ext=jpg'),
                ),
                Positioned(
                    right: -2,
                    bottom: -2,
                    height: 16,
                    width: 16,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          shape: BoxShape.circle,
                          color: online ? Colors.green : Colors.red),
                    ))
              ],
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Albert Flores',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Sia\'s owner',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('12:30',
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                Container(
                  padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    '${NumberFormat.compact().format(12)}',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}
