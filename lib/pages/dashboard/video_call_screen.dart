import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orix_pet/widgets/orix_pet_background.dart';

import 'widgets/pet_app_bar.dart';

///
/// Created by Sunil Kumar on 07-12-2020 10:30 PM.
///
class VideoCallScreen extends StatelessWidget {
  static const routeName = '/VideoCallScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrixPetBackground(
        colors: [Colors.green, Colors.yellow, Colors.purple, Colors.blue],
        child: Stack(
          children: [
            Positioned.fill(
                child: SvgPicture.asset(
              'assets/icons/cat1.svg',
            )),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: PetAppBar(
                title: Text("Pet Profile"),
                trailing: Material(
                  type: MaterialType.circle,
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings_rounded),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 120,
              right: 21,
              width: 100,
              height: 140,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(21),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://img.freepik.com/free-photo/girl_23-2148168226.jpg?size=338&ext=jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRect(
                  clipBehavior: Clip.antiAlias,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Column(
                      children: [
                        SizedBox(height: 18),
                        Text('Albert Flores',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                        SizedBox(height: 4),
                        Text('10:12',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        SizedBox(height: 18),
                        Row(
                          children: [
                            Spacer(),
                            Material(
                              type: MaterialType.circle,
                              color: Colors.white38,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Icon(Icons.mic_off_rounded,
                                    color: Colors.white),
                              ),
                            ),
                            Spacer(),
                            FloatingActionButton(
                              onPressed: () {},
                              child: Icon(Icons.call),
                              backgroundColor: Colors.red,
                            ),
                            Spacer(),
                            Material(
                              type: MaterialType.circle,
                              color: Colors.white38,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Icon(Icons.videocam_off_outlined,
                                    color: Colors.white),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 48),
                      ],
                    ),
                    // )
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
