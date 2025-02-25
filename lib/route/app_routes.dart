import 'package:contact/modules/home/home_view.dart';
import 'package:contact/modules/splash/splash_view.dart';
import 'package:contact/route/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

abstract class AppRoutes{
  static Route<dynamic> GeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoute.init:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case PagesRoute.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );
        default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Center(child: Text("Page Not Found")),
        ),
      );
    }
  }
}
// abstract class AppRoutes {
//   static Route<dynamic> GeneratedRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case PagesRoute.init:
//         return MaterialPageRoute(
//           builder: (context) => const SplashScreen(),
//           settings: settings,
//         );
//       case PagesRoute.welcome:
//         return MaterialPageRoute(
//           builder: (context) => const Welcome(),
//           settings: settings,
//         );
//       case PagesRoute.onBoarding:
//         return MaterialPageRoute(
//           builder: (context) => const OnBoarding(),
//           settings: settings,
//         );
//       case PagesRoute.signUP:
//         return MaterialPageRoute(
//           builder: (context) => const SignUP(),
//           settings: settings,
//         );
//       case PagesRoute.login:
//         return MaterialPageRoute(
//           builder: (context) => const Login(),
//           settings: settings,
//         );
//       case PagesRoute.forgetPass:
//         return MaterialPageRoute(
//           builder: (context) => const ForgetPassword(),
//           settings: settings,
//         );
//       case PagesRoute.nav:
//         return MaterialPageRoute(
//           builder: (context) => const Navigation(),
//           settings: settings,
//         );
//       case PagesRoute.home:
//         return MaterialPageRoute(
//           builder: (context) => const HomeView(),
//           settings: settings,
//         );
//       case PagesRoute.add:
//         return MaterialPageRoute(
//           builder: (context) => const AddEvent(),
//           settings: settings,
//         );
//       case PagesRoute.profile:
//         return MaterialPageRoute(
//           builder: (context) => const ProfileView(),
//           settings: settings,
//         );
//       case PagesRoute.favourite:
//         return MaterialPageRoute(
//           builder: (context) => const FavouriteView(),
//           settings: settings,
//         );
//       case PagesRoute.map:
//         return MaterialPageRoute(
//           builder: (context) => const MapScreen(),
//           settings: settings,
//         );
//
//       default:
//         return MaterialPageRoute(
//           builder: (context) => const SplashScreen(),
//           settings: settings,
//         );
//     }
//   }
// }
