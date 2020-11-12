import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    if (isDarkTheme) {
      return ThemeData.dark().copyWith(
        toggleableActiveColor: Colors.amber[600],
        indicatorColor: Colors.amber[600],
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.white),
          prefixStyle: TextStyle(color: Colors.white),
          counterStyle: TextStyle(color: Colors.white),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusColor: Colors.white,
        ),
        primaryColor: Colors.white
      );
    }
    return ThemeData.light().copyWith(
      toggleableActiveColor: Colors.amber[600],
      primaryColor: Colors.grey,
    );
  }
}
