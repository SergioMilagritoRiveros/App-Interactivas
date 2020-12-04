import 'package:animapp/blocs/DarkThemePreference.dart';
import 'package:flutter/material.dart';
import 'package:animapp/global.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    isDarkMode = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}