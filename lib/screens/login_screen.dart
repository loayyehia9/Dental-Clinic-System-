import 'package:flutter/material.dart';
import '../responsive.dart';
import '../services/utils.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailTextFocusNode = FocusNode();
  final FocusNode _passwordTextFocusNode = FocusNode();
  bool _isvisible = false;
  @override
  void initState() {
    _emailTextFocusNode.addListener(() {
      setState(() {});
    });
    _passwordTextFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailTextFocusNode.dispose();
    _passwordTextFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = Utils(context).getScreenSize.height;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Responsive.isMobile(context)
              ? const SizedBox()
              : Expanded(
                  child: Container(
                    height: height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1556745757-8d76bdb6984b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FzaGllcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Welcome to\nBint al Shat',
                      ),
                    ),
                  ),
                ),
          Expanded(
            child: Container(
              height: height,
              margin: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context)
                    ? height * 0.032
                    : height * 0.12,
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.2),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 60,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Text(
                            'Register',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        'Hey, Enter your details to get sign in \nto your account.',
                      ),
                    ),
                    SizedBox(height: height * 0.064),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            focusNode: _emailTextFocusNode,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: _emailTextFocusNode.hasFocus
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty || !value.contains("@")) {
                                return "Please, enter a valid email address";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                              ),
                              labelText: 'Email',
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            obscureText: _isvisible,
                            focusNode: _passwordTextFocusNode,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: _passwordTextFocusNode.hasFocus
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty || !value.contains("@")) {
                                return "Please, enter a valid email address";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: const Icon(
                                Icons.password_outlined,
                              ),
                              labelText: 'Password',
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
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.018),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password?',
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        },
                        child: Text('Login'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
