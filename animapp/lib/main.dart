import 'package:animapp/forms/scheduleForm.dart';
import 'package:flutter/material.dart';
import 'widgets/NavDrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String pageName = 'AnimaApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ScheduleForm());
  }
}
