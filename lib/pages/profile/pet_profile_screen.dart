import 'package:flutter/material.dart';
import 'package:orix_pet/pages/dashboard/widgets/pet_app_bar.dart';
import 'package:orix_pet/widgets/buttons.dart';
import 'package:orix_pet/widgets/orix_fab.dart';

import '../dashboard/pet_category_screen.dart';
import '../dashboard/video_call_screen.dart';
import '../dashboard/widgets/pet_sliver_delegate.dart';

///
/// Created by Sunil Kumar on 07-12-2020 08:22 PM.
///
class PetProfileScreen extends StatelessWidget {
  static const routeName = '/PetProfileScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PetAppBar(
            title: Text("Pet Profile"),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.fromLTRB(21, 21, 21, 21),
            children: [
              AspectRatio(
                aspectRatio: 4 / 4.1,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15,
                        offset: Offset(0, 1))
                  ], borderRadius: BorderRadius.all(Radius.circular(34))),
                  child: Stack(
                    children: [
                      Positioned.fill(
                          bottom: 100,
                          child: Image.network(
                            'https://images.unsplash.com/photo-1548681528-6a5c45b66b42?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8cGV0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=fill&w=500&q=60',
                            fit: BoxFit.cover,
                          )),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: CustomPaint(
                            painter: ProfileCardPaint(),
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(21, 28, 21, 28),
                              // decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: BorderRadius.only(
                              //         topLeft: Radius.circular(28))
                              // ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Kisa',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(height: 2),
                                        Text('Domestic short hair',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            PetPostHashTag(
                                                color: Colors.red,
                                                text: 'Adult'),
                                            SizedBox(width: 8),
                                            PetPostHashTag(
                                                color: Colors.amber,
                                                text: 'Male'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.deepPurpleAccent,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Icon(
                                          Icons.play_arrow_rounded,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                        right: 0,
                        bottom: 160,
                        child: RawMaterialButton(
                          onPressed: () {},
                          // disabledTextColor: Colors.white,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(0.0),
                          // textColor: Colors.white,
                          child: Ink(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffFDE150),
                                    Color(0xffFBDB2B)
                                  ],
                                ),
                              ),
                              child: Container(
                                constraints: BoxConstraints.tightFor(
                                    width: 60.0, height: 60.0),
                                alignment: Alignment.center,
                                child: IconTheme(
                                    data: IconThemeData(color: Colors.white),
                                    child: Icon(Icons.bookmark_rounded)),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 28),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 2,
                          offset: Offset(0, 1))
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(22))),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/girl_23-2148168226.jpg?size=338&ext=jpg'),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Albert Flores',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            'Sia\'s owner',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Material(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue.withOpacity(0.3),
                      clipBehavior: Clip.antiAlias,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints:
                              BoxConstraints.tightFor(width: 32, height: 32),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, VideoCallScreen.routeName);
                          },
                          icon: Icon(Icons.call, color: Colors.blue, size: 20)),
                    ),
                    SizedBox(width: 8),
                    Material(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red.withOpacity(0.3),
                      clipBehavior: Clip.antiAlias,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints:
                              BoxConstraints.tightFor(width: 32, height: 32),
                          onPressed: () {},
                          icon: Icon(Icons.mail_rounded,
                              color: Colors.red, size: 20)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'I am Mina. I am the more laid back of my brothers and I. I don\'t pour loud, but you can.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16),
              OrixPrimaryButton(
                child: Text('Adopt me'),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class ProfileCardPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 30)
      ..quadraticBezierTo(0, 0, 40, 0)
      ..lineTo(size.width - 40, 0)
      ..quadraticBezierTo(size.width, 0, size.width, -40)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
