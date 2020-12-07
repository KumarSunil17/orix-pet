import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar on 07-11-2020 08:47 PM.
///
mixin ColorUtils {
  static final Color lemon = Color(0xffFFD920);
  static final Color tomato = Color(0xffFF6243);
  static final Color dodgerBlue = Color(0xff3580FF);
  static const MaterialColor primary =
      MaterialColor(_primaryValue, <int, Color>{
    50: Color(0xFFE7F0FF),
    100: Color(0xFFC2D9FF),
    200: Color(0xFF9AC0FF),
    300: Color(0xFF72A6FF),
    400: Color(0xFF5393FF),
    500: Color(_primaryValue),
    600: Color(0xFF3078FF),
    700: Color(0xFF286DFF),
    800: Color(0xFF2263FF),
    900: Color(0xFF1650FF),
  });
  static const int _primaryValue = 0xFF3580FF;
}
