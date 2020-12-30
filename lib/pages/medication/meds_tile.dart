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
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.green[500],
          ),
          title: Text('${medicine.medicineName}'),
          subtitle: Text('${medicine.dosage}'
              ','
              '${medicine.medicineType}'
              ','
              '${medicine.dosage}'
              ','
              '${medicine.time}'
              ','
              '${medicine.interval}'),
        ),
      ),
    );
  }
}
