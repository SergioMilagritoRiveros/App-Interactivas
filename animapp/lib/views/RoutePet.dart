import 'package:animapp/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';

class RoutePet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RoutePetState();
  }
}

class _RoutePetState extends State<RoutePet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('AnimaApp'),
          backgroundColor: Colors.amber[300],
        ),
        backgroundColor: Colors.amberAccent[50],
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/como-llegar.jpeg"),
                    fit: BoxFit.fill)),
            ));
  }
}
