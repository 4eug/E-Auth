import 'package:e_auth/routes/routes.dart';
import 'package:e_auth/screens/home.dart';
import 'package:e_auth/screens/login.dart';
import 'package:e_auth/screens/register.dart';
import 'package:e_auth/screens/reset.dart';
import 'package:e_auth/screens/test.dart';
import 'package:e_auth/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // ignore: unused_local_variable
  final Map<String, dynamic> arguments = settings.arguments;
  switch (settings.name) {
    case welcomeScreenRoute:
      return PageTransition(
        child: WelcomeScreen(),
        type: PageTransitionType.fade,
      );

    case homeScreenRoute:
      return PageTransition(
        child: HomeScreen(),
        type: PageTransitionType.fade,
      );

    case loginScreenRoute:
      return PageTransition(
        child: LoginScreen(),
        type: PageTransitionType.fade,
      );

    case registerScreenRoute:
      return PageTransition(
        child: RegisterScreen(),
        type: PageTransitionType.fade,
      );

    case resetScreenRoute:
      return PageTransition(
        child: ResetScreen(),
        type: PageTransitionType.fade,
      );

    case testScreenRoute:
      return PageTransition(
        child: TestScreen(),
        type: PageTransitionType.fade,
      );

    default:
      return PageTransition(
        child: WelcomeScreen(),
        type: PageTransitionType.fade,
      );
  }
}
