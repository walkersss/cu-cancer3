import 'package:flutter/material.dart';

class ViewMedication extends StatefulWidget {
  @override
  _ViewMedicationState createState() => _ViewMedicationState();
}

class _ViewMedicationState extends State<ViewMedication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text('View Medicines'),
      ),
    );
  }
}
