import 'package:animapp/views/ScheduleForm.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../global.dart';
import 'package:page_transition/page_transition.dart';

class PlaceDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlaceDetailState();
  }
}

class _PlaceDetailState extends State<PlaceDetail> {
  Widget _scheduling(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        _getBackground(),
        _getGradient(),
        Row(
          children: [
            Container(
              width: phoneSize.width / 3,
              height: phoneSize.height / 1.11,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: phoneSize.width / 20,
              ),
              child: _getContent(Orientation.landscape),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 10,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: phoneSize.height / 1.04,
                child: ScheduleForm(isIntoWidget: true),
              ),
            ),
          ],
        ),
        _getToolbar(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (Orientation.landscape == orientation) {
          print(isScheduling);
          if (isScheduling) {
            return Scaffold(body: _scheduling(context));
          }
        }
        return Scaffold(
          body: Container(
            constraints: BoxConstraints.expand(),
            color: new Color(0xFFff9327),
            child: Stack(children: <Widget>[
              _getBackground(),
              _getGradient(),
              Center(child: _getContent(orientation)),
              _getToolbar(context)
            ]),
          ),
        );
      },
    );
  }

  Container _getBackground() {
    return Container(
      child: Image.asset(
        "images/petshop.png",
        fit: BoxFit.cover,
        height: 400.0,
      ),
      constraints: BoxConstraints.expand(height: 400.0),
    );
  }

  Container _getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 300.0),
      height: 110.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: <Color>[Color(0x00ffa247), Color(0xFFff9326)],
        stops: [0.0, 0.9],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.0, 1.0),
      )),
    );
  }

  Widget _getContent(Orientation orientation) {
    var phoneSize = MediaQuery.of(context).size;
    var width;
    var height;
    if (orientation == Orientation.portrait) {
      width = phoneSize.width / 1.2;
      height = phoneSize.height / 2;
    } else {
      width = phoneSize.width / 2.5;
      height = phoneSize.height / 1.15;
    }
    return Container(
      width: width,
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 15,
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/image-card2.png'),
              ),
              title: Text('Mayo Pet shop', style: TextStyle(fontSize: 20)),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(8, 15, 6, 15),
                ),
                _stars(),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 2, 15, 15),
              alignment: Alignment.topLeft,
              child: Text(
                "Tienda para articulos de mascotas",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Divider(height: 1.0, indent: 1.0),
            ListTile(
              leading: Icon(Icons.place),
              title: Text(
                'Cl. 165 ##8H-50, Bogotá, Cundinamarca',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Divider(height: 1.0, indent: 1.0),
            ListTile(
              leading: Icon(Icons.watch_later),
              title: Text(
                'Cerrado.   Abre a la(s) 10:00 a.m.',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Divider(height: 1.0, indent: 1.0),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('(1)8277777', style: TextStyle(fontSize: 12)),
            ),
            orientation == Orientation.portrait || !isScheduling
                ? ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Agendar Cita'),
                        onPressed: () {
                          if (orientation == Orientation.landscape) {
                            setState(() => isScheduling = true);
                          } else {
                            Navigator.push(
                              context, PageTransition(type: PageTransitionType.fade, child: ScheduleForm()),
                            );
                          }
                        },
                      ),
                    ],
                  )
                : Container(height: 0),
          ],
        ),
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackButton(color: Colors.white),
    );
  }

  Widget _uniqueStar() {
    return LikeButton(
      size: 25,
      circleColor:
          CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.star,
          color: isLiked ? Colors.amberAccent : Colors.grey,
          size: 25,
        );
      },
    );
  }

  Widget _stars() {
    return Align(
        alignment: Alignment.center,
        child: Row(
          children: [
            _uniqueStar(),
            SizedBox(),
            _uniqueStar(),
            SizedBox(),
            _uniqueStar(),
            SizedBox(),
            _uniqueStar(),
            SizedBox(),
            _uniqueStar(),
          ],
        ));
  }
}
