import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orix_pet/pages/authentication/login_screen.dart';
import 'package:orix_pet/pages/authentication/signup_screen.dart';
import 'package:orix_pet/pages/splash/splash_screen.dart';
import 'package:orix_pet/widgets/buttons.dart';
import 'package:orix_pet/widgets/orix_fab.dart';
import 'package:orix_pet/widgets/orix_header.dart';
import 'package:orix_pet/widgets/orix_pet_background.dart';
part 'intro_bottom_sheet.dart';

///
/// Created by Sunil Kumar on 16-11-2020 09:18 PM.
///
class IntroScreen extends StatefulWidget {
  static const routeName = '/IntroScreen';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentIndex = 0;
  late PageController _topPageController, _mainPageController;
  @override
  void initState() {
    super.initState();
    _topPageController = PageController();
    _mainPageController = PageController()..addListener(_onMainScroll);
  }

  void dispose() {
    _topPageController.dispose();
    _mainPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrixPetBackground(
        colors: const [
          Color(0xffFFF4B8),
          Color(0xffFFD5B4),
          Color(0xffABFAFF),
          Color(0xff9EFFF8),
          Color(0xffEBBCFF),
          Color(0xffDCFFB4)
        ],
        child: SafeArea(
          child: Column(
            children: [
              Spacer(),
              Hero(
                tag: 1,
                flightShuttleBuilder: (
                  BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext,
                ) {
                  return Material(
                    child: OrixHeader(),
                    type: MaterialType.transparency,
                  );
                },
                child: OrixHeader(),
              ),
              Spacer(),
              Expanded(
                flex: 4,
                child: PageView.builder(
                  controller: _topPageController,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) =>
                      SvgPicture.asset(_introData[index].imagePath),
                  itemCount: _introData.length,
                  onPageChanged: (i) {
                    setState(() {
                      _currentIndex = i;
                    });
                  },
                ),
              ),
              Spacer(),
              IntroBottomSheet(_introData[_currentIndex],
                  onPageChanged: _goToPage, pageController: _mainPageController)
            ],
          ),
        ),
      ),
    );
  }

  _goToPage(int page) {
    setState(() {
      _currentIndex = page;
    });
    _topPageController.animateToPage(page,
        duration: Duration(milliseconds: 150), curve: Curves.decelerate);
    _mainPageController.animateToPage(page,
        duration: Duration(milliseconds: 40), curve: Curves.decelerate);
  }

  _onMainScroll() {
    _topPageController.animateTo(_mainPageController.offset,
        duration: Duration(milliseconds: 150), curve: Curves.decelerate);
  }
}
