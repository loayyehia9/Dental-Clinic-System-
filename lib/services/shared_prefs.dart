import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static Future<void> setValue(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      await prefs.setBool(key, value);
    }
  }

  static Future<dynamic> getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.get(key);
  }
}
