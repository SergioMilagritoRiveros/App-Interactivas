import 'package:animapp/blocs/darkThemeProvider.dart';
import 'package:animapp/global.dart';
import 'package:animapp/views/map.dart';
import 'package:animapp/views/welcomePage.dart';
import 'package:animapp/widgets/NavDrawer.dart';
import 'package:animapp/widgets/showMenu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:animapp/views/placeDetail.dart';
import 'package:provider/provider.dart';
import '../widgets/bezierContainer.dart';

import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'dart:math' as math show sin, pi;

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
    return ProgressButton(
      defaultWidget: Text('buscar'),

      //const Icon(Icons.check, color: Colors.black),
      progressWidget: ThreeSizeDot(
        color_1: Color(0xffe46b10),
        color_2: Color(0xffe46b10),
        color_3: Color(0xffe46b10),
      ),
      width: 114,
      height: 48,
      borderRadius: 24,
      animate: false,
      type: ProgressButtonType.Outline,
      onPressed: () async {
        int score =
            await Future.delayed(const Duration(milliseconds: 2000), () => 42);
        if (!_isLandscape)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MapPage()),
          );
      },
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
      appBar: AppBar(
        title: Text('AnimaApp'),
        backgroundColor: Colors.amber[700],
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => showPopupMenu(context),
          )
        ],
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

class ThreeSizeDot extends StatefulWidget {
  ThreeSizeDot(
      {Key key,
      this.shape = BoxShape.circle,
      this.duration = const Duration(milliseconds: 1000),
      this.size = 8.0,
      this.color_1,
      this.color_2,
      this.color_3,
      this.padding = const EdgeInsets.all(2)})
      : super(key: key);

  final BoxShape shape;
  final Duration duration;
  final double size;
  final Color color_1;
  final Color color_2;
  final Color color_3;
  final EdgeInsetsGeometry padding;

  @override
  _ThreeSizeDotState createState() => _ThreeSizeDotState();
}

class _ThreeSizeDotState extends State<ThreeSizeDot>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation_1;
  Animation<double> animation_2;
  Animation<double> animation_3;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: widget.duration);
    animation_1 = DelayTween(begin: 0.0, end: 1.0, delay: 0.0)
        .animate(animationController);
    animation_2 = DelayTween(begin: 0.0, end: 1.0, delay: 0.2)
        .animate(animationController);
    animation_3 = DelayTween(begin: 0.0, end: 1.0, delay: 0.4)
        .animate(animationController);
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ScaleTransition(
            scale: animation_1,
            child: Padding(
              padding: widget.padding,
              child: Dot(
                shape: widget.shape,
                size: widget.size,
                color:
                    widget.color_1 ?? Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          ScaleTransition(
            scale: animation_2,
            child: Padding(
              padding: widget.padding,
              child: Dot(
                shape: widget.shape,
                size: widget.size,
                color:
                    widget.color_2 ?? Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          ScaleTransition(
            scale: animation_3,
            child: Padding(
              padding: widget.padding,
              child: Dot(
                shape: widget.shape,
                size: widget.size,
                color:
                    widget.color_3 ?? Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final BoxShape shape;
  final double size;
  final Color color;

  Dot({
    Key key,
    this.shape,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: shape),
      ),
    );
  }
}

class DelayTween extends Tween<double> {
  DelayTween({
    double begin,
    double end,
    this.delay,
  }) : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

/*return RaisedButton(
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
    );*/
