import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/img_manager.dart';
import '../resources/string_manager.dart';
import '../resources/values_manager.dart';

class GlobalMethods {
  static Future<void> errorWarningDialog({
    required String subTitle,
    required BuildContext context,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                ImgManager.warningImg,
                height: AppMargin.m20,
                width: AppMargin.m20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: AppMargin.m10,
              ),
              Text(AppString.anErrorOccurred),
            ],
          ),
          content: Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Text(
                AppString.ok,
              ),
            ),
          ],
        );
      },
    );
  }
}
