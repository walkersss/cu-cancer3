import 'package:flutter/material.dart';
import 'package:cu_cancer/models/medicine.dart';

class MedsTile extends StatelessWidget {
  final Medicine medicine;
  MedsTile({this.medicine});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: Icon(Icons.local_pharmacy_outlined),
          title: Text(
              '${medicine.medicineName} ${medicine.dosage} ${medicine.medicineType}'),
          subtitle: Text('${medicine.interval}'
              ' ${medicine.time}'),
        ),
      ),
    );
  }
}
