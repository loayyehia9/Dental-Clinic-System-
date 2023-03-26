import 'package:flutter/material.dart';
import '../resources/constants.dart';
import '../resources/values_manager.dart';
import '../responsive.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
    required this.backgroundColor,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: Const.defaultPadding * AppSize.s1_5,
          vertical: Const.defaultPadding /
              (Responsive.isDesktop(context) ? AppSize.s1 : AppSize.s2),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: AppSize.s20,
      ),
      label: Text(text),
    );
  }
}
