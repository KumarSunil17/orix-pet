import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

///
/// Created by Sunil Kumar on 07-12-2020 08:30 PM.
///
class PetAppBar extends StatelessWidget {
  final EdgeInsets appBarPadding;
  final Widget leading;
  final Widget title;
  final Widget trailing;
  final double elevation;
  PetAppBar(
      {this.appBarPadding,
      this.leading,
      this.title,
      this.trailing,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: appBarPadding ?? const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: elevation ?? 15,
                offset: Offset(0, 1),
                spreadRadius: 1)
          ]),
      child: SafeArea(
        child: Row(
          children: [
            if (leading == null)
              if (Navigator.canPop(context))
                Material(
                    type: MaterialType.circle,
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    child: BackButton())
              else
                Image.asset('assets/icons/logo.png', height: 42, width: 42)
            else
              leading,
            SizedBox(width: 6),
            DefaultTextStyle(
              style: theme.textTheme.headline6
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w800),
              child: title == null
                  ? Text(
                      'Orix Pet',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
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
                  icon: SvgPicture.asset('assets/icons/menu.svg'),
                ),
              )
            else
              trailing
          ],
        ),
      ),
    );
  }
}
