import 'package:flutter/material.dart';

import 'resources/values_manager.dart';
import 'services/utils.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);

  // This isMobile, isDesktop help us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppSize.s850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppSize.s1100;

  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).getScreenSize;
    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= AppSize.s1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
