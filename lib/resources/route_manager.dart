import '../screens/auth/screens/forget_password_screen.dart';

import '../screens/auth/screens/login_screen.dart';
import '../screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'string_manager.dart';

class Routes {
  static const String login = '/Login';
  static const String forgetPassword = '/ForgetPassword';
  static const String main = '/Main';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );
      case Routes.main:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            AppString.noRouteFound,
          ),
        ),
      ),
    );
  }
}
