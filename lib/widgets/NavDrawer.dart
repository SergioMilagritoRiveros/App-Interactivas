import 'package:animapp/blocs/darkThemeProvider.dart';
import 'package:animapp/views/ScheduledAppointment.dart';
import 'package:animapp/views/forum.dart';
import 'package:animapp/views/welcomePage.dart';
import 'package:animapp/views/whatAreYouSearchingFor.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  DarkThemeProvider darkTheme = new DarkThemeProvider();
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Drawer(
      child: Container( 
        color: darkTheme.darkTheme ? Colors.grey[850] : Colors.white,
        child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'AnimaApp',
              style: TextStyle(color: darkTheme.darkTheme ? Colors.black : Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.yellowAccent,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/cover-pet.png'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: LiteRollingSwitch(
              value: !themeChange.darkTheme,
              textOn: "Ligth",
              textOff: "Dark",
              colorOn: Colors.amberAccent,
              colorOff: Colors.grey,
              iconOn: Icons.wb_sunny,
              iconOff: Icons.nightlight_round,
              textSize: 18.0,
              onChanged: (bool position){
                themeChange.darkTheme = !position;
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Busqueda', style: TextStyle(color: darkTheme.darkTheme ? Colors.white : Colors.black)),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WhatAreYouSearchingFor()))
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Foros', style: TextStyle(color: darkTheme.darkTheme ? Colors.white : Colors.black)),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Forum(title: "Animapp")))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Citas Agendadas', style: TextStyle(color: darkTheme.darkTheme ? Colors.white : Colors.black)),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ScheduledAppointment()))
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar sesión', style: TextStyle(color: darkTheme.darkTheme ? Colors.white : Colors.black)),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomePage()))
            },
          ),
        ],
      )),
    );
  }
}
