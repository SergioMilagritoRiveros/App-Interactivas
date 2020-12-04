import 'dart:async';

import 'package:animapp/views/placeDetail.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Size size;

  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  GoogleMapController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, PageTransition(type: PageTransitionType.fade, child: null))),
        title: Text('AnimaApp'),
        backgroundColor: Colors.amber[700],
      ),
      backgroundColor: Colors.amberAccent[50],
      body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        if (Orientation.portrait == orientation) {
          return _map();
        } else {
          return _map();
        }
      }),
    );
  }

  setMarkers() {
    _markers.add(
      Marker(
        markerId: MarkerId('llegar'),
        position: LatLng(4.742877841155348, -74.03123976473584),
        onTap: () => Navigator.push(
          context, PageTransition(type: PageTransitionType.fade, child:PlaceDetail()),
        ),
      ),
    );
  }

  Widget _map() {
    setMarkers();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
          markers: _markers,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          initialCameraPosition: CameraPosition(
              target: LatLng(4.742877841155348, -74.03123976473584),
              zoom: 15.0),
        ),
      ),
    );
  }
}
