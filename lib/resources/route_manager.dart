import 'package:flutter/material.dart';
import 'string_manager.dart';

class Routes {}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
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
