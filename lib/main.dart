import 'package:animapp/views/map.dart';
import 'package:animapp/views/forum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:animapp/views/forum_detail.dart';
import 'package:animapp/views/whatAreYouSearchingFor.dart';
=======
import 'package:responsive_builder/responsive_builder.dart';

import 'views/welcomePage.dart';
>>>>>>> 03da3fa05f512fec6938eaa92a53db85bf5c6dd7

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Animapp',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ResponsiveBuilder(
        builder: (context, sizing) {
          return Forum(title: "Animapp");
        },
      ),
    );
  }
}
