import 'package:animapp/global.dart';
import 'package:animapp/views/ScheduleAppointment_model.dart';
import 'package:animapp/views/ScheduledAppointment.dart';
import 'package:flutter/material.dart';

class ScheduledDetail extends StatefulWidget {
  final ScheduleApponitmentModel model;
  final bool isWidget;
  ScheduledDetail({Key key, @required this.model, this.isWidget = false})
      : super(key: key);

  @override
  _ScheduledDetailState createState() => _ScheduledDetailState();
}

class _ScheduledDetailState extends State<ScheduledDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (widget.isWidget) {
      return _scheduledDetailWidget(size);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimaApp'),
        backgroundColor: Colors.amber[700],
      ),
      backgroundColor: Colors.amberAccent[50],
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (Orientation.portrait == orientation) {
            return _scheduledDetailPortraitBody(size, context);
          } else {
            Navigator.pop(context);
            return Container();
          }
        },
      ),
    );
  }

  Widget _scheduledDetailWidget(Size size) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: size.height / 40),
          Text(
            '${widget.model.type}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: size.height / 30),
            height: size.height / 4,
            child: Image.asset(widget.model.imageURL),
          ),
          SizedBox(height: size.height / 40),
          Text(
            '${widget.model.name}',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height / 40),
          Text(
            'Dirección: ${widget.model.address}',
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height / 40),
          Text(
            'Fecha/Hora: ${widget.model.date}',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height / 40),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: size.width / 40),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.redAccent[400],
                onPressed: () {
                  var snackBar = SnackBar(
                    content: Text('Se ha cancelado su cita.'),
                    action: SnackBarAction(
                      label: 'Entendido',
                      onPressed: () {},
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  child: new Text("Cancelar", textAlign: TextAlign.center),
                  width: MediaQuery.of(context).size.width / 7,
                ),
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }

  Widget _scheduledDetailPortraitBody(size, context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: size.height / 8),
          Text(
            '${widget.model.type}',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: size.height / 30),
            height: size.height / 4,
            child: Image.asset(widget.model.imageURL),
          ),
          SizedBox(height: size.height / 40),
          Text(
            '${widget.model.name}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: size.height / 40),
          Text('Dirección: ${widget.model.address}',
              style: TextStyle(fontSize: 15)),
          SizedBox(height: size.height / 40),
          Text('Fecha/Hora: ${widget.model.date}'),
          SizedBox(height: size.height / 40),
          RaisedButton(
            color: Colors.redAccent[400],
            onPressed: () {
              var snackBar = SnackBar(
                content: Text('Se ha cancelado tu cita.'),
                action: SnackBarAction(
                  label: 'Entendido',
                  onPressed: () => Navigator.pop(context),
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: size.height / 50),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Cancelar',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
