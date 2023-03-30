import '../resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dark_theme_provider.dart';
import '../resources/color_manager.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get color =>
      getTheme ? ColorManager.whiteColor : ColorManager.blackColor;
  Size get getScreenSize => MediaQuery.of(context).size;
  double get getDefaultVerticalMargin => getScreenSize.height * AppMargin.m0_02;
}
