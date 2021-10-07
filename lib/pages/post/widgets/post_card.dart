import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

///
///Created By Sunil Kumar at 27/11/2020
///
class PetPostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        elevation: 6,
        shadowColor: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 4, 14, 14),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/girl_23-2148168226.jpg?size=338&ext=jpg'),
                ),
                title: Text('Amelia\'s cat'),
                subtitle: Text('16 Min'),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_border_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 8),
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Image.network(
                          'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8cGV0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'))),
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PostCardAction(
                      color: Colors.pink,
                      onPressed: () {},
                      asset: 'assets/icons/like.svg',
                      count: 12),
                  PostCardAction(
                      color: Colors.amber,
                      onPressed: () {},
                      asset: 'assets/icons/comment.svg',
                      count: 1212121212),
                  PostCardAction(
                      color: Colors.blue,
                      onPressed: () {},
                      asset: 'assets/icons/share.svg',
                      count: 12),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostCardAction extends StatelessWidget {
  final int count;
  final String asset;
  final Color color;
  final VoidCallback? onPressed;

  const PostCardAction({required this.asset, required this.color, required this.count, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Material(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          splashColor: color,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              SvgPicture.asset(
                asset,
                color: color,
                height: 21,
                width: 21,
              ),
              SizedBox(width: 4),
              Text(NumberFormat.compact().format(count),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: color, fontWeight: FontWeight.w600))
            ]),
          ),
        ));
  }
}
