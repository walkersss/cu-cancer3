import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:cu_cancer/pages/home/name_tile.dart';
import 'package:cu_cancer/models/cell.dart';

class NameCard extends StatefulWidget {
  final Cell cell;
  NameCard({this.cell});
  @override
  _NameCardState createState() => _NameCardState();
}

class _NameCardState extends State<NameCard> {
  @override
  Widget build(BuildContext context) {
    final cell = Provider.of<Cell>(context) ?? [];
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, name) {
        return Card(
            //child: Text('${cell.name}'),
            );
      },
    );
  }
}
