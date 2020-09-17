import 'package:animapp/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';

class ScheduledAppointment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScheduledAppointmentState();
  }
}

class _ScheduledAppointmentState extends State<ScheduledAppointment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('AnimaApp'),
        backgroundColor: Colors.amber[300],
      ),
      backgroundColor: Colors.amberAccent[50],
      body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(height: 50),
                Text("Tus Citas Agendadas", style: TextStyle(fontSize: 30.0), textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
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
                              padding: const EdgeInsets.only(left: 16.0),
                              child: myDetailsContainer1(),
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 200,
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
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
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
                              padding: const EdgeInsets.only(left: 16.0),
                              child: myDetailsContainer3(),
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 180,
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
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
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
                              padding: const EdgeInsets.only(left: 16.0),
                              child: myDetailsContainer2(),
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 180,
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
                      )),
                ),
              ),
            ),
          ],
      ),
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
                color: Color(0xffe6020a),
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Veterinaria Dog Pet \u00B7 20/09/2020  11:40 am",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Cra. 78 #4-06, Bogotá, Cundinamarca",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
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
                color: Color(0xffe6020a),
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Veterinaria Mi perrito feliz \u00B7 23/09/2020  9:00 am",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Ciudad De Cali #36-21, Kennedy, Bogotá",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
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
                color: Color(0xffe6020a),
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "Veterinaria Doblesse \u00B7 30/09/2020  01:30 pm",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            " Cra. 21 #1, Antonio Nariño, Bogotá",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        )
      ],
    );
  }
}
