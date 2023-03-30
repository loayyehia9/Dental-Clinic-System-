import '../../../screens/auth/widgets/form_responsive_handler.dart';
import 'package:flutter/material.dart';
import '../../../resources/icon_manager.dart';
import '../../../resources/img_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../services/utils.dart';
import '../widgets/auth_img_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final util = Utils(context);
    double height = util.getScreenSize.height;
    double defaultVerticalMargin = util.getDefaultVerticalMargin;
    Color color = util.color;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AuthImgWidget(
                imageUrl: ImgManager.forgetPassword,
              ),
              FormResponsiveHandler(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * AppMargin.m0_2),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        AppString.forgetPassword,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    SizedBox(height: defaultVerticalMargin),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || !value.contains("@")) {
                            return AppString.emailError;
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: AppString.email,
                          prefixIcon: Icon(
                            IconManager.msg,
                            color: color,
                          ),
                          labelText: AppString.email,
                        ),
                      ),
                    ),
                    SizedBox(height: defaultVerticalMargin),
                    SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          AppString.send,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: BackButton(
              color: color,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
