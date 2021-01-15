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
        color: Color(0xffFCB97F),
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(7, 10, 7, 0),
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
                    style: TextButton.styleFrom(primary: Colors.blue[700]),
                    child: const Text('Update & Delete'),
                    onPressed: () {
                      print("Update Pressed");
                    },
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.red[700]),
                    child: const Text('Delete'),
                    onPressed: () {
                      print("Delete Pressed");
                    },
                  ),
                  //TextButton(
                  //  style: ButtonStyle(),
                  //  child: const Text('Delete'),
                  //  onPressed: () {
                  //    print("Delete Pressed");
                  //  },
                  //),
                ]),
          ],
        ),
      ),
    );
  }
}
