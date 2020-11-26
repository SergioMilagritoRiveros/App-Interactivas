import 'package:animapp/views/ScheduleAppointment_model.dart';
import 'package:animapp/views/ScheduledAppoinntment_detail.dart';
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
  ScheduleApponitmentModel _selected;
  @override
  Widget build(BuildContext context) {
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
          var size = MediaQuery.of(context).size;
          if (orientation == Orientation.portrait) {
            return _buildPortrait(size);
          } else {
            return _buildPortrait(size);
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
        child: ForumDetail(
          title: widget.title,
          forum: _selected,
          isWidget: true,
        ),
      );
    }
    return Container();
  }

  Widget _buildLandscape(Size size) {
    ScheduleApponitmentModel _selected;
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: size.width / 50),
          width: size.width / 3,
          child: Column(
            children: [
              SizedBox(height: size.height / 50),
              Text(
                "Tus Citas Agendadas",
                style: TextStyle(fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: scheduleAppointmentList.length,
                    itemBuilder: (context, index) {
                      var list = scheduleAppointmentList[index];
                      return RaisedButton(
                        elevation: 0,
                        color: Colors.transparent,
                        onPressed: () => setState(() => _selected = list),
                        child: Card(
                          child: Column(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0)),
                                elevation: 14.0,
                                shadowColor: Color(0x802196F3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Text("${list.type}"),
                                    ),
                                    Container(
                                      height: size.height / 5,
                                      child: ClipRRect(
                                        borderRadius:
                                            new BorderRadius.circular(24.0),
                                        child: Image(
                                          fit: BoxFit.contain,
                                          alignment: Alignment.topRight,
                                          image: AssetImage(
                                              'images/image-card.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      );
                    }),
              )
            ],
          ),
        )
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
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ScheduledDetail(model: post)
                    ),
                  ),
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(post.imageURL, width: size.width/4),
                        ListTile(
                          title: Text(post.type, textAlign: TextAlign.center),
                          subtitle: Text("${post.name}",  textAlign: TextAlign.center),
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
