import 'package:animapp/forms/scheduleForm.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_http_request.dart';
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
    initializeDateFormatting('es',null);
    return MaterialApp(home: ScheduleForm());
  }
}
