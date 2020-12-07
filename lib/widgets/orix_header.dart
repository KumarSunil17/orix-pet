import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar on 26-11-2020 03:48 PM.
///
class OrixHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/icons/logo.png', height: 60, width: 60),
          SizedBox(height: 12),
          Text('Orix Pet',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
          SizedBox(height: 4),
          Text('Community we all need',
              style:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
        ]);
  }
}
