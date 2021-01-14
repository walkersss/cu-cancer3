import 'package:flutter/material.dart';
import 'package:cu_cancer/models/appointment.dart';

class AppointmentTile extends StatelessWidget {
  final Appointment appointment;
  AppointmentTile({this.appointment});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 15,
        color: Color(0xfffa8b2a),
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: Icon(Icons.calendar_today_outlined),
          title: Text('${appointment.name} '),
          subtitle: Text('${appointment.type} ${appointment.department}'
              '${appointment.time} ${appointment.date}'),
        ),
      ),
    );
  }
}
