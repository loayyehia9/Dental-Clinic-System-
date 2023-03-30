import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/menu_controller.dart';
import 'providers/dark_theme_provider.dart';
import 'resources/route_manager.dart';
import 'resources/string_manager.dart';
import 'resources/theme_manager.dart';
import 'screens/auth/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MenuController(),
        ),
        ChangeNotifierProvider(
          create: (_) {
            return themeChangeProvider;
          },
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppString.appTitle,
            theme: ThemeManager.themeData(themeProvider.getDarkTheme, context),
            initialRoute: Routes.login,
            onGenerateRoute: RouteGenerator.getRoute,
          );
        },
      ),
    );
  }
}
