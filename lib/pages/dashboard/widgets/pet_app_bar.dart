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

  PetAppBar({this.appBarPadding, this.leading, this.title, this.trailing});

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
                blurRadius: 15,
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
      ),
    );
  }
}
