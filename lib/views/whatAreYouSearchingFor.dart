import 'package:animapp/views/map.dart';
import 'package:animapp/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:animapp/views/placeDetail.dart';
import '../widgets/bezierContainer.dart';

class WhatAreYouSearchingFor extends StatefulWidget {
  WhatAreYouSearchingFor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WhatAreYouSearchingForState createState() => _WhatAreYouSearchingForState();
}

class _WhatAreYouSearchingForState extends State<WhatAreYouSearchingFor> {
  bool _isLandscape = false;
  bool _petShop = false;
  bool _peluqueria = false;
  bool _veterinaria = false;
  bool _agendamientoDigital = false;

  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  GoogleMapController _controller;

  Widget _submitButton() {
    return RaisedButton(
      elevation: 0,
      color: Colors.transparent,
      onPressed: () {
        if (!_isLandscape)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MapPage()),
          );
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 90,
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: Text(
          'Buscar',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
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
      SizedBox(height: 10),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '¿Qué buscas?',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 20,
            fontWeight: FontWeight.w700,
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
    var size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height - 10;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('AnimaApp'),
        backgroundColor: Colors.amber[700],
      ),
      backgroundColor: Colors.amberAccent[50],
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (Orientation.portrait == orientation) {
            _isLandscape = false;
            return formulario(height, width);
          } else {
            _isLandscape = true;
            setMarkers();
            return formularioHorizontal(size, height);
          }
        },
      ),
    );
  }

  Widget formulario(height, width) {
    return Container(
      height: height,
      width: width,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .25,
              right: -MediaQuery.of(context).size.width * .5,
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
    );
  }

  Widget formularioHorizontal(Size size, height) {
    return Row(children: [
      Container(
        width: size.width / 3,
        child: ListView(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 99),
            _listaOpciones(),
            SizedBox(height: .20),
            _submitButton(),
            _divider(),
            SizedBox(height: MediaQuery.of(context).size.height * .1),
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * .65,
        child: GoogleMap(
          markers: _markers,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          initialCameraPosition: CameraPosition(
              target: LatLng(4.742877841155348, -74.03123976473584),
              zoom: 15.0),
        ),
      )
    ]);
  }

  setMarkers() {
    _markers.add(
      Marker(
        markerId: MarkerId('llegar'),
        position: LatLng(4.742877841155348, -74.03123976473584),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlaceDetail()),
        ),
      ),
    );
  }
}
