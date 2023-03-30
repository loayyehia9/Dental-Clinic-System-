import 'package:flutter/material.dart';
import '../../../resources/icon_manager.dart';
import '../../../resources/img_manager.dart';
import '../../../resources/route_manager.dart';
import '../../../resources/string_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../responsive.dart';
import '../../../services/utils.dart';
import '../widgets/auth_img_widget.dart';
import '../widgets/form_responsive_handler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool _isvisible = false;

  @override
  void dispose() {
    super.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final util = Utils(context);
    double height = util.getScreenSize.height;
    double defaultVerticalMargin = util.getDefaultVerticalMargin;
    Color color = util.color;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AuthImgWidget(
            imageUrl: ImgManager.login,
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
                    AppString.login,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(height: defaultVerticalMargin),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    AppString.loginWelcome,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                SizedBox(height: defaultVerticalMargin),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
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
                      const SizedBox(
                        height: AppMargin.m18,
                      ),
                      TextFormField(
                        obscureText: _isvisible,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppString.passwordError;
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: AppString.password,
                          prefixIcon: Icon(
                            IconManager.password,
                            color: color,
                          ),
                          labelText: AppString.password,
                          suffixIcon: InkWell(
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                _isvisible = !_isvisible;
                              });
                            },
                            child: Icon(
                              _isvisible
                                  ? IconManager.visibility
                                  : IconManager.visibilityOff,
                              color: color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: defaultVerticalMargin),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.forgetPassword);
                    },
                    child: const Text(
                      AppString.forgetPassword,
                    ),
                  ),
                ),
                SizedBox(height: defaultVerticalMargin),
                SizedBox(
                  width: double.infinity,
                  height: AppSize.s40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.main);
                    },
                    child: Text(
                      AppString.login,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
