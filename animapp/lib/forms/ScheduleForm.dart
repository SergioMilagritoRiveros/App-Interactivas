import 'package:animapp/widgets/InputWidget.dart';
import 'package:animapp/widgets/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class ScheduleForm extends StatefulWidget {
  static const routeName = "/schedule-form";

  @override
  State<StatefulWidget> createState() {
    return _ScheduleForm();
  }
}

class _ScheduleForm extends State<ScheduleForm> {
  String dropdownValue = 'Perro';

  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerTime = TextEditingController();
  DateTime _dateTime = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  String getDate(DateTime date) =>
      DateFormat('dd - MMMM - yyyy').format(date);
  String getTime(TimeOfDay time) =>
      "${time.hour}:${time.minute}";

  Widget _buildPet() {
    return FormField(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: 'Seleccione su tipo de mascota',
            icon: Icon(Icons.pets),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              isDense: true,
              onChanged: (value) => setState(() => dropdownValue = value),
              items: <String>['Perro', 'Gato']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
    /* return DropdownButton<String>(
      value: 'Perro',
      iconSize: 24,
      elevation: 16,
      underline: Container(
        height: 2,
        color: Colors.grey[400],
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Perro', 'Gato']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ); */
  }

  void _selectDate(context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _dateTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 60)),
    );
    if (picked != null) {
      setState(() {
        _controller.text = getDate(picked);
        _dateTime = picked;
      });
    }
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        _controllerTime.text = getTime(t);
        time = t;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('AnimaApp'),
        backgroundColor: Colors.amber[300],
      ),
      backgroundColor: Colors.amberAccent[50],
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Text("Agenda tu cita", style: TextStyle(fontSize: 30.0)),
                SizedBox(height: 30),
                Container(
                    child: _buildPet(),
                    width: MediaQuery.of(context).size.width),
                SizedBox(height: 30),
                TextFormField(
                  controller: _controller,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    enabled: true,
                    labelText: 'Fecha de la cita',
                    icon: Icon(Icons.today),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _controllerTime,
                  onTap: () => _pickTime(),
                  decoration: InputDecoration(
                    enabled: true,
                    labelText: 'Hora de la cita',
                    icon: Icon(Icons.access_time),
                  ),
                ),
                //SizedBox(height: 30,),
                //DateTimePickerPage(),
                SizedBox(height: 30),
                Container(
                    child: InputWidget(labelText: 'Número de contacto', icon: Icons.phone_android, keyboardType: TextInputType.phone),
                    width: MediaQuery.of(context).size.width),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.green[300],
                        onPressed: () => '',
                        child: Container(
                          child: new Text("Agendar"),
                          width: MediaQuery.of(context).size.width / 7,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => '',
                      textColor: Colors.white,
                      color: Colors.red[300],
                      child: Container(
                        child: new Text("Cancelar"),
                        width: MediaQuery.of(context).size.width / 7,
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
