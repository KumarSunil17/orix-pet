import 'package:flutter/material.dart';
import 'package:orix_pet/pages/dashboard/dashboard_screen.dart';
import 'package:orix_pet/pages/splash/splash_screen.dart';
import 'package:orix_pet/utils/colors.dart';
import 'package:orix_pet/utils/page_routes_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Orix Pet',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Mulish',
          primarySwatch: ColorUtils.primary,
          primaryColor: ColorUtils.primary,
          accentColor: ColorUtils.primary,
          // canvasColor: ColorUtils.brightBackgroundColor,
          cursorColor: ColorUtils.primary,
          iconTheme: IconThemeData(color: Colors.black),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.light,
          textSelectionHandleColor: ColorUtils.primary,
          textSelectionColor: ColorUtils.primary.withOpacity(0.3),
        ),
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: PageRouteConfig.onGeneratedRoute);
  }
}
