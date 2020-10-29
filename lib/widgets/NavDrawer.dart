import 'package:animapp/views/ScheduledAppointment.dart';
import 'package:animapp/views/forum.dart';
import 'package:animapp/views/welcomePage.dart';
import 'package:animapp/views/whatAreYouSearchingFor.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'AnimaApp',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.yellowAccent,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/cover-pet.png'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Busqueda'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            WhatAreYouSearchingFor()))},
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Foros'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            Forum(title: "Animapp")))},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Citas Agendadas'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            ScheduledAppointment()))},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar sesión'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            WelcomePage()))},
          ),
        ],
      ),
    );
  }
}
