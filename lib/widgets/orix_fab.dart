import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar on 25-11-2020 09:50 AM.
///
class OrixFab extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  OrixFab({this.onPressed, this.child});

  @override
  _OrixFabState createState() => _OrixFabState();
}

class _OrixFabState extends State<OrixFab> {
  bool isHighlighted = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(
              color: Color(0xffFEEFB6),
              spreadRadius: isHighlighted ? 4 : 2,
              blurRadius: 5,
              offset: Offset(
                0,
                isHighlighted ? 7 : 5,
              )),
        ]),
        child: RawMaterialButton(
          onPressed: widget.onPressed,
          // disabledTextColor: Colors.white,
          shape: CircleBorder(),
          padding: EdgeInsets.all(0.0),
          // textColor: Colors.white,
          onHighlightChanged: (b) {
            isHighlighted = b;
            setState(() {});
          },
          child: Ink(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffFDE150), Color(0xffFBDB2B)],
                ),
              ),
              child: Container(
                constraints: BoxConstraints.tightFor(width: 60.0, height: 60.0),
                alignment: Alignment.center,
                child: IconTheme(
                    data: IconThemeData(color: Colors.white),
                    child: widget.child ?? Icon(Icons.forward)),
              )),
        ),
      ),
    );
  }
}
