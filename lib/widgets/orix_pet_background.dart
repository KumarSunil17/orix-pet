import 'dart:ui';

import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar on 16-11-2020 10:14 AM.
///
class OrixPetBackground extends StatelessWidget {
  final List<Color> colors;
  final Widget? child;
  OrixPetBackground({required this.colors, this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRect(
      child: Stack(
        children: [
          Positioned.fill(
            child: ColoredBox(color: Colors.blue.shade50),
          ),
          ...colors
              .map((e) => Align(
                    alignment: _getAlignment(colors.indexOf(e)),
                    child: Container(height: 180, width: 180, color: e),
                  ))
              .toList(),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 90.0, sigmaY: 90.0),
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.grey.shade200.withOpacity(0.5)),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Alignment _getAlignment(int index) {
    switch (index) {
      case 0:
        return Alignment(-1, -1);
      case 1:
        return Alignment(1, -1);
      case 2:
        return Alignment(-1, 1);
      case 3:
        return Alignment(1, 1);

      case 4:
        return Alignment(-1, 0.8);
      case 5:
        return Alignment(1, 0.8);
      // case 6: return Alignment(0,0);
      // case 7: return Alignment(0,0);
    }
    return Alignment.center;
  }
}

class BackgroundDecoration {
  Color color;
  double? height, width, top, left, right, bottom;

  BackgroundDecoration(
      {required this.color,
      this.height,
      this.width,
      this.top,
      this.left,
      this.right,
      this.bottom});
}
