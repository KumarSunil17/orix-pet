import 'package:flutter/material.dart';
import 'package:orix_pet/pages/authentication/login_screen.dart';
import 'package:orix_pet/pages/authentication/signup_screen.dart';
import 'package:orix_pet/pages/dashboard/chat_screen.dart';
import 'package:orix_pet/pages/dashboard/dashboard_screen.dart';
import 'package:orix_pet/pages/dashboard/pet_category_screen.dart';
import 'file:///D:/Flutter_app/orix_pet/lib/pages/profile/pet_profile_screen.dart';
import 'package:orix_pet/pages/dashboard/settings_screen.dart';
import 'package:orix_pet/pages/dashboard/video_call_screen.dart';
import 'package:orix_pet/pages/intro/intro_screen.dart';
import 'package:orix_pet/pages/splash/splash_screen.dart';

///
/// Created by Sunil Kumar on 26-11-2020 08:25 PM.
///
class PageRouteConfig {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (c) => SplashScreen());
      case IntroScreen.routeName:
        return MaterialPageRoute(builder: (c) => IntroScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (c) => LoginScreen());
      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (c) => SignUpScreen());
      case DashboardScreen.routeName:
        return MaterialPageRoute(builder: (c) => DashboardScreen());
      case PetCategoryScreen.routeName:
        return MaterialPageRoute(builder: (c) => PetCategoryScreen());
      case PetProfileScreen.routeName:
        return MaterialPageRoute(builder: (c) => PetProfileScreen());
      case VideoCallScreen.routeName:
        return MaterialPageRoute(builder: (c) => VideoCallScreen());
      case ChatScreen.routeName:
        return MaterialPageRoute(builder: (c) => ChatScreen());
      case SettingsScreen.routeName:
        return MaterialPageRoute(builder: (c) => SettingsScreen());
      default:
        return MaterialPageRoute(builder: (c) => SplashScreen());
    }
  }
}
