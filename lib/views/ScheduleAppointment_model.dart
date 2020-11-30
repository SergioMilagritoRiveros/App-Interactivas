import 'package:flutter/material.dart';

class ScheduleApponitmentModel {
  String imageURL;
  String type;
  String name;
  String date;
  String address;

  ScheduleApponitmentModel({
    this.imageURL =
        'images/image-card.png',
    @required this.type,
    @required this.name,
    @required this.address,
    @required this.date
  });

  // ignore: missing_return
  ScheduleApponitmentModel fromJSON(string) {}
}

var scheduleAppointmentList = [
  ScheduleApponitmentModel(
    type: 'Baño',
    name: 'Veterinaria Dog Pet',
    date: '20/09/2020  11:40 am',
    address: 'Cra. 78 #4-06, Bogotá, Cundinamarca'
  ),
   ScheduleApponitmentModel(
    type: 'Consulta Veterinario',
    name: 'Veterinaria perro feliz',
    date: '23/09/2020  9:00 am',
    address: 'Ciudad De Cali #36-21, Kennedy, Bogotá'
  ),
   ScheduleApponitmentModel(
    type: 'Consulta Veterinario',
    name: 'Veterinaria Doblesse',
    date: '30/09/2020  01:30 pm',
    address: 'Cra. 21 #1, Antonio Nariño, Bogotá'
  ),
];
