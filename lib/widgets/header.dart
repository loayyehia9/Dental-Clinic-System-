import '../resources/string_manager.dart';
import '../services/utils.dart';
import '/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../resources/constants.dart';
import '../resources/icon_manager.dart';
import '../responsive.dart';

class Header extends StatelessWidget {
  final String screenName;
  final Function fct;
  const Header({
    Key? key,
    required this.fct,
    required this.screenName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(
              IconManager.menu,
              color: color,
            ),
            onPressed: () {
              fct();
            },
          ),
        if (Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              screenName,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        if (Responsive.isDesktop(context))
          Spacer(
            flex: Responsive.isDesktop(context)
                ? AppMargin.m2.toInt()
                : AppMargin.m1.toInt(),
          ),
        Expanded(
          child: TextField(
            style: TextStyle(color: color),
            decoration: InputDecoration(
              hintText: AppString.search,
              suffixIcon: InkWell(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  margin: const EdgeInsets.symmetric(
                      horizontal: Const.defaultPadding / AppMargin.m2),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        AppSize.s10,
                      ),
                    ),
                  ),
                  child: const Icon(
                    IconManager.search,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
