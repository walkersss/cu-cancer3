import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cu_cancer/pages/medication/meds_tile.dart';
import 'package:cu_cancer/models/medicine.dart';

class MedsList extends StatefulWidget {
  @override
  _MedsListState createState() => _MedsListState();
}

class _MedsListState extends State<MedsList> {
  @override
  Widget build(BuildContext context) {
    final medicine = Provider.of<List<Medicine>>(context) ?? [];
    return ListView.builder(
      itemCount: medicine.length,
      itemBuilder: (context, index) {
        return MedsTile(medicine: medicine[index]);
      },
    );
  }
}
