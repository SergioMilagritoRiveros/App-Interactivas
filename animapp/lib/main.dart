
import 'package:animapp/forms/ScheduleForm.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String pageName = 'AnimaApp';

  @override
  Widget build(BuildContext context) {
    //initializeDateFormatting('es',null);
    return MaterialApp(home: ScheduleForm());
  }
}
