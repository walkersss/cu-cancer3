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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 15,
        color: Color(0xfffa8b2a),
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.local_pharmacy_outlined),
              title: Text('${medicine.medicineName} '),
              subtitle: Text(
                  '${medicine.dosage} ${medicine.medicineType} ${medicine.interval}'
                  ' ${medicine.time}'),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextButton(
                    child: const Text('Update'),
                    onPressed: () {
                      print("Update Pressed");
                    },
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    style: ButtonStyle(),
                    child: const Text('Delete'),
                    onPressed: () {
                      print("Delete Pressed");
                    },
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
