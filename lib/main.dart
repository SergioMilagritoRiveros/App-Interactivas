import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'blocs/ThemeData.dart';
import 'blocs/darkThemeProvider.dart';
import 'views/welcomePage.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme()
        ;
  }

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget child) {
            return MaterialApp(
              title: 'Animapp',
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              home: WelcomePage()
            );
          },
        ),);
  }
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return MaterialApp(
//       title: 'Animapp',
//       theme: ThemeData(
//         primarySwatch: Colors.amber,
//         textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
//           bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: WelcomePage(),
//     );
//   }
// }
