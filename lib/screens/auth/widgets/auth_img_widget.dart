import 'package:flutter/material.dart';
import '../../../responsive.dart';
import '../../../services/utils.dart';

class AuthImgWidget extends StatelessWidget {
  final String imageUrl;
  const AuthImgWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = Utils(context).getScreenSize.height;
    return Visibility(
      visible: !Responsive.isMobile(context),
      child: Expanded(
        child: Container(
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
