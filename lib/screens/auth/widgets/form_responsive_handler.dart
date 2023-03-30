import 'package:flutter/material.dart';

import '../../../resources/values_manager.dart';
import '../../../responsive.dart';
import '../../../services/utils.dart';

class FormResponsiveHandler extends StatelessWidget {
  final Widget child;
  const FormResponsiveHandler({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final util = Utils(context);
    double height = util.getScreenSize.height;
    return Expanded(
      child: Container(
        height: height,
        margin: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context)
              ? height * AppMargin.m0_032
              : height * AppMargin.m0_12,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: AppPadding.p40),
          child: child,
        ),
      ),
    );
  }
}
