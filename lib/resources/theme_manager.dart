import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'values_manager.dart';

class ThemeManager {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme
          ? ColorManager.scaffoldDarkColor
          : ColorManager.scaffoldLightColor,
      primaryColor: ColorManager.blueColor,
      cardColor: isDarkTheme
          ? ColorManager.cardDarkColor
          : ColorManager.cardLightColor,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light(),
          ),
      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
          borderSide: const BorderSide(
            color: ColorManager.blueColor,
            width: AppSize.s1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
          borderSide: BorderSide(
            color: ColorManager.greyColor,
            width: AppSize.s1,
          ),
        ),
      ),
    );
  }
}
