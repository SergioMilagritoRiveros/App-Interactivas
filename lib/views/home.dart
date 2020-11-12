import 'package:animapp/global.dart';
import 'package:animapp/views/ScheduledAppointment.dart';
import 'package:animapp/views/forum.dart';
import 'package:animapp/views/whatAreYouSearchingFor.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  FFNavigationBarTheme _bottomNavigationBar;

  List<Widget> views = [
    WhatAreYouSearchingFor(),
    Forum(),
    ScheduledAppointment(),
  ];

  @override
  Widget build(BuildContext context) {
    if (isDarkMode) {
      _bottomNavigationBar = FFNavigationBarTheme(
        barBackgroundColor: Colors.grey[800],
        selectedItemBackgroundColor: Colors.blue,
        selectedItemIconColor: Colors.white,
        selectedItemBorderColor: Colors.grey[800],
        unselectedItemIconColor: Colors.lightBlue,
        selectedItemLabelColor: Colors.white,
        unselectedItemLabelColor: Colors.white,
      );
    } else {
      _bottomNavigationBar = FFNavigationBarTheme(
        barBackgroundColor: Colors.white,
        selectedItemBackgroundColor: Colors.amber,
        selectedItemIconColor: Colors.white,
        selectedItemLabelColor: Colors.grey[800],
        unselectedItemIconColor: Colors.grey[600],
        unselectedItemLabelColor: Colors.grey[600],
      );
    }
    return Scaffold(
      body: views[selectedIndex],
      bottomNavigationBar: FFNavigationBar(
        theme: _bottomNavigationBar,
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.search,
            label: 'Busqueda',
          ),
          FFNavigationBarItem(
            iconData: Icons.chat,
            label: 'Foros',
          ),
          FFNavigationBarItem(
            iconData: Icons.today,
            label: 'Citas',
          ),
        ],
      ),
    );
  }
}
