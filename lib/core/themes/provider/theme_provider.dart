import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = "theme_mode";

  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  static Future<void> initialize() async {
    await SharedPreferences.getInstance();
  }

  ThemeProvider() {
    loadTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final dark = prefs.getBool(_themeKey) ?? true;

    _themeMode = dark ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
      await prefs.setBool(_themeKey, false);
    } else {
      _themeMode = ThemeMode.dark;
      await prefs.setBool(_themeKey, true);
    }

    notifyListeners();
  }
}
