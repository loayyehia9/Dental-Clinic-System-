import '../resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'values_manager.dart';

class ThemeManager {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    Color color =
        isDarkTheme ? ColorManager.whiteColor : ColorManager.blackColor;
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
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: FontSize.s60,
          fontWeight: FontWeightManager.bold,
          color: color,
        ),
        labelMedium: TextStyle(
          fontSize: FontSize.s30,
          fontWeight: FontWeightManager.semiBold,
          color: color,
        ),
        labelSmall: const TextStyle(
          fontSize: FontSize.s22,
          fontWeight: FontWeightManager.normal,
          color: ColorManager.whiteColor,
        ),
      ),

      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: color,
        suffixIconColor: color,
        labelStyle: TextStyle(
          color: color,
        ),
        hintStyle: TextStyle(
          color: color,
        ),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    );
  }
}
