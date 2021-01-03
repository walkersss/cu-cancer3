import 'package:cu_cancer/models/medicine.dart';
import 'package:cu_cancer/services/database.dart';
import 'package:cu_cancer/pages/medication/medsList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cu_cancer/models/notes.dart';
import 'package:cu_cancer/pages/pain/pain_List.dart';
import 'package:cu_cancer/pages/appointment/appointmentList.dart';
import 'package:cu_cancer/models/appointment.dart';

class ViewMedication extends StatefulWidget {
  @override
  _ViewMedicationState createState() => _ViewMedicationState();
}

class _ViewMedicationState extends State<ViewMedication> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Medicine>>.value(
      value: DatabaseServices().medicine,
      child: Scaffold(
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/medicalbg.jpg'),
                      fit: BoxFit.cover)),
              child: MedsList()),
        ),
      ),
    );
  }
}

class PainDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Notes>>.value(
      value: DatabaseServices().notes,
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/medicalbg.jpg'),
                      fit: BoxFit.cover)),
              child: PainList())),
    );
  }
}

class ViewAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Appointment>>.value(
      value: DatabaseServices().appointment,
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/medicalbg.jpg'),
                      fit: BoxFit.cover)),
              child: AppointmentList())),
    );
  }
}
