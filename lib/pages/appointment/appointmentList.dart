import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cu_cancer/pages/appointment/appointmentTile.dart';
import 'package:cu_cancer/models/appointment.dart';

class AppointmentList extends StatefulWidget {
  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    final appointment = Provider.of<List<Appointment>>(context) ?? [];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ListView.builder(
              itemCount: appointment.length,
              itemBuilder: (context, index) {
                return AppointmentTile(appointment: appointment[index]);
              });
        },
      ),
    );
  }
}
