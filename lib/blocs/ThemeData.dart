import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    print("si estoy entrando");
    print("$isDarkTheme");
    return ThemeData(
      primarySwatch: Colors.amber, //esto ya esta
      /* textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
        bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
      ), */
      primaryColor: isDarkTheme ? Colors.grey[700] : Colors.white, //ya esta
      backgroundColor: isDarkTheme ? Colors.grey[600] : Color(0xffF1F5FB), //ya esta
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8), //pendiente
      scaffoldBackgroundColor: isDarkTheme ? Color(0xff120035) : Colors.white,
      cursorColor: isDarkTheme ? Colors.white : Colors.black,
      hintColor: isDarkTheme ? Colors.white : Colors.black,
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      textSelectionHandleColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF9c9a9a) : Colors.white,
      //brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
