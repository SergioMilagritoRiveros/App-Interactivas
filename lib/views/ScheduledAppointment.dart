import 'package:animapp/views/ScheduleAppointment_model.dart';
import 'package:animapp/views/ScheduledAppoinntment_detail.dart';
import 'package:animapp/widgets/showMenu.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ScheduledAppointment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScheduledAppointmentState();
  }
}

class _ScheduledAppointmentState extends State<ScheduledAppointment> {
  ScheduleApponitmentModel _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  Widget _buildSelected(Size size) {
    if (_selected != null) {
      return Container(
        padding: EdgeInsets.only(left: size.width / 50),
        width: 2 * size.width / 3,
        child: ScheduledDetail(
          model: _selected,
          isWidget: true,
        ),
      );
    }
    return Container();
  }

  Widget _buildLandscape(Size size) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: size.width / 50),
          width: size.width / 3,
          child: Column(
            children: [
              SizedBox(height: size.height / 40),
              Text(
                'Tus citas agendadas',
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height / 25),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: scheduleAppointmentList.length,
                  itemBuilder: (context, index) {
                    var post = scheduleAppointmentList[index];
                    return RaisedButton(
                      elevation: 0,
                      color: Colors.transparent,
                      onPressed: () => setState(() => _selected = post),
                      child: Card(
                        child: Column(
                          children: [
                            Image.asset(post.imageURL, width: size.width / 5),
                            ListTile(
                              title: Text(post.type, textAlign: TextAlign.center),
                              subtitle: Text("${post.name}",
                                  textAlign: TextAlign.center),
                            ),
                          ],
                        ),
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        _buildSelected(size),
      ],
    );
  }

  Widget _buildPortrait(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width / 20),
      child: Column(
        children: [
          SizedBox(height: size.height / 25),
          Text(
            'Tus citas agendadas',
            style: TextStyle(fontSize: 30.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height / 25),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: scheduleAppointmentList.length,
              itemBuilder: (context, index) {
                var post = scheduleAppointmentList[index];
                return RaisedButton(
                  elevation: 0,
                  color: Colors.transparent,
                  onPressed: () => Navigator.push(
                    context, PageTransition(type: PageTransitionType.fade, child: ScheduledDetail(model: post)),
                  ),
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(post.imageURL, width: size.width / 4),
                        ListTile(
                          title: Text(post.type, textAlign: TextAlign.center),
                          subtitle:
                              Text("${post.name}", textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
