import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orix_pet/pages/dashboard/dashboard_screen.dart';
import 'package:orix_pet/pages/intro/intro_screen.dart';
import 'package:orix_pet/widgets/orix_pet_background.dart';

///
/// Created by Sunil Kumar on 11-11-2020 10:14 AM.
///
class SplashScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 3)).then((value) {
        Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final splashChild = Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        direction: Axis.vertical,
        children: [
          Image.asset(
            'assets/icons/logo.png',
            height: 140,
            width: 140,
          ),
          SizedBox(height: 12),
          Text('Orix Pet',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 21)),
          SizedBox(height: 4),
          Text('Community we all need', style: TextStyle(color: Colors.grey)),
        ]);
    return Scaffold(
        body: OrixPetBackground(
            colors: const [
          Color(0xffA5FFF4),
          Color(0xffD2FFCE),
          Color(0xffFFD4D1),
          Color(0xffB4FFFA)
        ],
            child: Stack(
              children: [
                Center(
                  child: Hero(
                    tag: 1,
                    flightShuttleBuilder: (
                      BuildContext flightContext,
                      Animation<double> animation,
                      HeroFlightDirection flightDirection,
                      BuildContext fromHeroContext,
                      BuildContext toHeroContext,
                    ) {
                      return Material(
                        child: ClipRect(
                            clipBehavior: Clip.antiAlias, child: splashChild),
                        type: MaterialType.transparency,
                      );
                    },
                    child: splashChild,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SvgPicture.asset(
                    'assets/icons/paws.svg',
                    width: MediaQuery.of(context).size.width - 58,
                  ),
                )
              ],
            )));
  }
}
