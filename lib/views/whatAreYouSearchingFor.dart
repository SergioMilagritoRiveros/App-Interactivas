import 'package:animapp/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/InputWidget.dart';
import '../widgets/bezierContainer.dart';
import 'forgottenPassword.dart';
import 'signup.dart';

class WhatAreYouSearchingFor extends StatefulWidget {
  WhatAreYouSearchingFor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WhatAreYouSearchingForState createState() => _WhatAreYouSearchingForState();
}

class _WhatAreYouSearchingForState extends State<WhatAreYouSearchingFor> {
  bool _petShop = false;
  bool _peluqueria = false;
  bool _veterinaria = false;
  bool _agendamientoDigital = false;

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: Text(
        'Buscar',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Column(children: [
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Animapp',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
        ),
      ),
      SizedBox(height: 30),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '¿Qué buscas?',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      )
    ]);
  }

  Widget _listaOpciones() {
    return Column(children: [
      Card(
          child: SwitchListTile(
        title: const Text('PetShop'),
        value: _petShop,
        onChanged: (bool value) {
          setState(() {
            _petShop = value;
          });
        },
      )),
      Card(
          child: SwitchListTile(
        title: const Text('Peluquería'),
        value: _peluqueria,
        onChanged: (bool value) {
          setState(() {
            _peluqueria = value;
          });
        },
      )),
      Card(
          child: SwitchListTile(
        title: const Text('Veterinaria'),
        value: _veterinaria,
        onChanged: (bool value) {
          setState(() {
            _veterinaria = value;
          });
        },
      )),
      Card(
          child: SwitchListTile(
        title: const Text('Agendamiento Digital'),
        value: _agendamientoDigital,
        onChanged: (bool value) {
          setState(() {
            _agendamientoDigital = value;
          });
        },
      ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('AnimaApp'),
          backgroundColor: Colors.amber[700],
        ),
        backgroundColor: Colors.amberAccent[50],
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      _title(),
                      SizedBox(height: 50),
                      _listaOpciones(),
                      SizedBox(height: 20),
                      _submitButton(),
                      _divider(),
                      SizedBox(height: height * .055),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
