part of 'intro_screen.dart';

///
/// Created by Sunil Kumar on 16-11-2020 09:28 PM.
///
class IntroBottomSheet extends StatelessWidget {
  final IntroModel introDatum;
  final ValueChanged<int>? onPageChanged;

  final PageController? pageController;
  IntroBottomSheet(this.introDatum, {this.onPageChanged, this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: double.infinity,
        child: CustomPaint(
            painter: IntroSheetPainter(),
            child: Column(children: [
              SizedBox(height: 8),
              OrixFab(onPressed: () {
                pageController?.nextPage(
                    duration: Duration(milliseconds: 40),
                    curve: Curves.decelerate);
              }),
              SizedBox(height: 16),
              Expanded(
                child: PageView.builder(
                    controller: pageController,
                    itemBuilder: (ctx, i) => Column(children: [
                          Text(introDatum.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w800)),
                          SizedBox(height: 14),
                          Text(
                            introDatum.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w600),
                          )
                        ]),
                    itemCount: _introData.length,
                    onPageChanged: onPageChanged),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _introData
                    .map((e) => AnimatedContainer(
                          duration: kThemeAnimationDuration,
                          height: 4,
                          width: introDatum == e ? 20 : 15,
                          decoration: BoxDecoration(
                              color: introDatum == e
                                  ? Colors.blue
                                  : Colors.grey[400],
                              borderRadius: BorderRadius.circular(3)),
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                        ))
                    .toList(),
              ),
              SizedBox(height: 16),
              Row(children: [
                SizedBox(width: 16),
                Expanded(
                    child: OrixFlatButton(
                        child: Text('Sign Up'),
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        })),
                SizedBox(width: 16),
                Expanded(
                    child: OrixPrimaryButton(
                        child: Text('Log In'),
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        })),
                SizedBox(width: 16)
              ]),
              SizedBox(height: 21),
            ])));
  }
}

class IntroModel {
  String imagePath;
  String title;
  String description;

  IntroModel({required this.imagePath, required this.title, required this.description});
}

final List<IntroModel> _introData = [
  IntroModel(
      imagePath: 'assets/icons/cat_love.svg',
      title: 'Easy to Adopt',
      description:
          'Join us for pet adoption across the country\ngive them a loving home too.'),
  IntroModel(
      imagePath: 'assets/icons/dog2.svg',
      title: 'Safe and Healthy',
      description:
          'Find tips on how to keep your pet healthy &\nwhich pet brands to use for your pet.'),
  IntroModel(
      imagePath: 'assets/icons/dog1.svg',
      title: 'Need your Support',
      description:
          'Help those pets deserves adoption.\nEvery pet needs a loving home.')
];

class IntroSheetPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.7;
    Paint paint1 = Paint()
      ..color = Colors.white54
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.7;
    Path path_0 = Path();

    final halfW = size.width / 2;

    path_0.moveTo(0, size.height - 30);
    path_0.lineTo(0, 60);
    path_0.quadraticBezierTo(0, 33, 30, 30); //top left corner
    path_0.cubicTo(
        halfW - 40, 30, halfW - 120, 30, halfW - 80, 30); // peak bottom left
    path_0.cubicTo(halfW - 40, 30, halfW - 30, 0, halfW, 0); // peak top left
    path_0.cubicTo(
        halfW + 30, 0, halfW + 30, 30, halfW + 80, 30); // peak top right
    path_0.cubicTo(halfW + 80, 30, halfW + 80, 30, size.width - 30,
        30); // peak bottom right

    path_0.quadraticBezierTo(size.width * 1.00, size.height * 0.10,
        size.width * 1.00, size.height * 0.20);
    path_0.lineTo(size.width * 1.00, size.height * 0.90);
    path_0.quadraticBezierTo(size.width * 1.00, size.height * 1.00,
        size.width * 0.93, size.height * 1.00);
    path_0.cubicTo(size.width * 0.70, size.height * 0.99, size.width * 0.30,
        size.height * 1.00, size.width * 0.07, size.height * 1.00);
    path_0.quadraticBezierTo(size.width * -0.00, size.height * 1.00,
        size.width * 0.00, size.height * 0.90);
    path_0.close();
    canvas.drawPath(path_0, paint1);
    canvas.drawPath(path_0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
