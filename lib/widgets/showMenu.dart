import 'package:animapp/blocs/darkThemeProvider.dart';
import 'package:animapp/global.dart';
import 'package:animapp/views/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showPopupMenu(context) async {
  await showMenu(
    context: context,
    position: RelativeRect.fromLTRB(100, 100, 0, 0),
    items: [
      PopupMenuItem<String>(
        child: SwitchListTile(
            value: isDarkMode,
            onChanged: (value) {
              var provider =
                  Provider.of<DarkThemeProvider>(context, listen: false);
              provider.darkTheme = value;
              Navigator.pop(context);
            },
            title: Text('Nocturno')),
        value: 'DarkMode',
      ),
      PopupMenuItem<String>(
          child: ListTile(
            title: Text('Cerrar sesión'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomePage(),
                ),
              );
            },
          ),
          value: 'SignOut'),
    ],
    elevation: 8.0,
  );
}
