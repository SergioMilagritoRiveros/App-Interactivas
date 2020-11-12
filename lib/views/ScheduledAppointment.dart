import 'package:animapp/blocs/darkThemeProvider.dart';
import 'package:animapp/widgets/NavDrawer.dart';
import 'package:animapp/widgets/showMenu.dart';
import 'package:flutter/material.dart';

class ScheduledAppointment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScheduledAppointmentState();
  }
}

class _ScheduledAppointmentState extends State<ScheduledAppointment> {
  DarkThemeProvider darkTheme = new DarkThemeProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimaApp'),
        backgroundColor: darkTheme.darkTheme ? Colors.blue : Color(0xffe46b10),
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
          var size = MediaQuery.of(context).size;
          if (orientation == Orientation.portrait) {
            return _buildPortrait(size);
          } else {
            return _buildLandscape(size);
          }
        },
      ),
    );
  }

  Widget _buildLandscape(Size size) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        SizedBox(height: size.height / 50),
        Text(
          "Tus Citas Agendadas",
          style: TextStyle(fontSize: 30.0),
          textAlign: TextAlign.center,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: size.height / 50),
          height: size.height / 4,
          child: new FittedBox(
            child: Material(
              color: Colors.transparent,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width / 50),
                      child: myDetailsContainer1(),
                    ),
                  ),
                  Container(
                    height: size.height / 3,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.contain,
                        alignment: Alignment.topRight,
                        image: AssetImage('images/image-card.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: size.height / 50),
          height: size.height / 4,
          child: new FittedBox(
            child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width / 50),
                      child: myDetailsContainer2(),
                    ),
                  ),
                  Container(
                    height: size.height / 3,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.contain,
                        alignment: Alignment.topRight,
                        image: AssetImage('images/image-card.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: size.height / 4,
          margin: EdgeInsets.symmetric(vertical: size.height / 50),
          child: new FittedBox(
            child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width / 50),
                      child: myDetailsContainer3(),
                    ),
                  ),
                  Container(
                    height: size.height / 3,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.contain,
                        alignment: Alignment.topRight,
                        image: AssetImage('images/image-card.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPortrait(Size size) {
    Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
    );
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        SizedBox(height: size.height / 50),
        Text(
          "Tus Citas Agendadas",
          style: TextStyle(fontSize: 30.0),
          textAlign: TextAlign.center,
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width / 45, vertical: size.height / 50),
          child: new FittedBox(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0)),
              elevation: 14.0,
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width / 50),
                      child: myDetailsContainer1(),
                    ),
                  ),
                  Container(
                    height: size.height / 5,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.contain,
                        alignment: Alignment.topRight,
                        image: AssetImage('images/image-card.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width / 45, vertical: size.height / 50),
          child: new FittedBox(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0)),
              elevation: 14.0,
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width / 50),
                      child: myDetailsContainer2(),
                    ),
                  ),
                  Container(
                    height: size.height / 5,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.contain,
                        alignment: Alignment.topRight,
                        image: AssetImage('images/image-card.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width / 45, vertical: size.height / 50),
          child: new FittedBox(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0)),
              elevation: 14.0,
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width / 50),
                      child: myDetailsContainer3(),
                    ),
                  ),
                  Container(
                    height: size.height / 5,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.contain,
                        alignment: Alignment.topRight,
                        image: AssetImage('images/image-card.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget myDetailsContainer1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Baño",
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.amber[600],
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Veterinaria Dog Pet \u00B7 20/09/2020  11:40 am",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Cra. 78 #4-06, Bogotá, Cundinamarca",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          )),
        )
      ],
    );
  }

  Widget myDetailsContainer2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Consulta Veterinario",
            style: TextStyle(
                color: Colors.amber[600],
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Veterinaria perro feliz \u00B7 23/09/2020  9:00 am",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Ciudad De Cali #36-21, Kennedy, Bogotá",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          )),
        )
      ],
    );
  }

  Widget myDetailsContainer3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Consulta Veterinario",
            style: TextStyle(
                color: Colors.amber[600],
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Veterinaria Doblesse \u00B7 30/09/2020  01:30 pm",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            " Cra. 21 #1, Antonio Nariño, Bogotá",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          )),
        )
      ],
    );
  }
}
