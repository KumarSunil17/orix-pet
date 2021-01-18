import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orix_pet/pages/dashboard/profile_screen.dart';
import 'package:orix_pet/pages/dashboard/widgets/dashboard_bottom_nav.dart';
import 'package:orix_pet/pages/post/widgets/post_card.dart';
import 'package:orix_pet/widgets/accept_deny_switch/accept_deny_switch.dart';
import 'package:orix_pet/widgets/orix_pet_background.dart';
import 'messages_screen.dart';
import 'home_screen.dart';
import 'widgets/dashboard_header.dart';

///
/// Created by Sunil Kumar on 26-11-2020 07:40 PM.
///
class DashboardScreen extends StatefulWidget {
  static const routeName = '/DashboardScreen';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  SwitchState state = SwitchState.initial;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        if (bottomNavCurrentIndex.value == 0)
          return true;
        else {
          bottomNavCurrentIndex.value = 0;
          return false;
        }
      },
      child: Scaffold(
        body: ValueListenableBuilder<int>(
          valueListenable: bottomNavCurrentIndex,
          builder: (context, i, child) {
            switch (i) {
              case 0:
                return HomeScreen();
              case 2:
                return MessagesScreen();
              case 3:
                return ProfileScreen();
            }
            return HomeScreen();
          },
        ),
        bottomNavigationBar: DashboardBottomNav(),
      ),
    );
  }
}

class BodyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final paint1 = Paint()
      ..color = Colors.greenAccent.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, height / 2)
      ..quadraticBezierTo(width / 4, height / 3, width / 2.2, height / 2.5)
      ..quadraticBezierTo(width / 1.3, height / 2, width, 30)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    final margin = 20.0;

    final path1 = Path()
      ..moveTo(0, (height / 2) - margin)
      ..quadraticBezierTo(width / 4, (height / 3) - margin, width / 2.2,
          (height / 2.5) - margin)
      ..quadraticBezierTo(width / 1.3, (height / 2) - margin, width, 0)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
