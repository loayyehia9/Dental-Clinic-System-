import 'package:flutter/material.dart';
import '../services/shared_prefs.dart';

class DarkThemeProvider with ChangeNotifier {
  static const THEME_STATUS = "THEMESTATUS";
  bool _darkTheme = false;

  getThemeFromPrefs() async {
    return await SharedPrefs.getValue(THEME_STATUS) ?? false;
  }

  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    SharedPrefs.setValue(THEME_STATUS, value);
    notifyListeners();
  }
}
