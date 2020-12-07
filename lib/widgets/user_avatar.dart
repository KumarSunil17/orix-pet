import 'package:flutter/material.dart';

class UserCircleAvatar extends StatelessWidget {
  final String userId;
  final String name;
  final String imageUrl;
  final double radius;
  const UserCircleAvatar(this.imageUrl, {this.userId, this.name, this.radius});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Hero(
      tag: userId ?? UniqueKey().toString(),
      child: FadeInImage.assetNetwork(
        image: imageUrl,
        placeholder: '',
        fit: BoxFit.cover,
      ),
    );
  }
}
