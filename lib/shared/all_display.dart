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
  void initState() {
    super.initState();
    print('initstate for medication');
  }

  final Color myHexColor2 = Color(0xff08AE9E);
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
        floatingActionButton: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {
            Navigator.pushNamed(context, '/addmedication');
          },
          child: Icon(Icons.add),
          backgroundColor: myHexColor2,
        ),
      ),
    );
  }
}

class PainDisplay extends StatefulWidget {
  @override
  _PainDisplayState createState() => _PainDisplayState();
}

class _PainDisplayState extends State<PainDisplay> {
  void initState() {
    super.initState();
    print('initstate for pain');
  }

  final Color myHexColor2 = Color(0xff08AE9E);

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
            child: PainList()),
        floatingActionButton: FloatingActionButton(
          heroTag: "btn2",
          onPressed: () {
            Navigator.pushNamed(context, '/painAdd');
          },
          child: Icon(Icons.add),
          backgroundColor: myHexColor2,
        ),
      ),
    );
  }
}

class ViewAppointment extends StatefulWidget {
  @override
  _ViewAppointmentState createState() => _ViewAppointmentState();
}

class _ViewAppointmentState extends State<ViewAppointment> {
  void initState() {
    super.initState();
    print('initstate for appointment');
  }

  final Color myHexColor2 = Color(0xff08AE9E);

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
            child: AppointmentList()),
        floatingActionButton: FloatingActionButton(
          heroTag: "btn3",
          onPressed: () {
            Navigator.pushNamed(context, '/addEvent');
          },
          child: Icon(Icons.add),
          backgroundColor: myHexColor2,
        ),
      ),
    );
  }
}
