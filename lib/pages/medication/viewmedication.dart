import 'package:cu_cancer/models/medicine.dart';
import 'package:cu_cancer/services/database.dart';
import 'package:cu_cancer/pages/medication/medsList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewMedication extends StatefulWidget {
  @override
  _ViewMedicationState createState() => _ViewMedicationState();
}

class _ViewMedicationState extends State<ViewMedication> {
  @override
  Widget build(BuildContext context) {
    Color myHexColor2 = Color(0xff08AE9E);
    return StreamProvider<List<Medicine>>.value(
      value: DatabaseService().medicine,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: myHexColor2,
          title: Text('Your Medication'),
          elevation: 0,
        ),
        body: MedsList(),
      ),
    );
  }
}
