import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar on 10-12-2020 01:40 PM.
///
class OrixTabIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  OrixTabIndicator(
      {this.indicatorColor = Colors.amber, this.indicatorHeight = 8});
  @override
  BoxPainter createBoxPainter([onChanged]) {
    return _IndicatorPainter(this, onChanged);
  }
}

class _IndicatorPainter extends BoxPainter {
  final OrixTabIndicator authTabIndicator;
  _IndicatorPainter(this.authTabIndicator, onChanged) : super(onChanged);
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Rect rect = Offset(
            offset.dx + configuration.size.width / 2 - 20,
            (configuration.size.height - authTabIndicator.indicatorHeight ??
                8)) &
        Size(40, authTabIndicator.indicatorHeight ?? 8);
    final Paint paint = Paint();
    paint.color = authTabIndicator.indicatorColor ?? Colors.amber;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          rect,
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
        paint);
  }
}
