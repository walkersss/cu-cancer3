import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cu_cancer/pages/pain/pain_tile.dart';
import 'package:cu_cancer/models/notes.dart';

class PainList extends StatefulWidget {
  @override
  _PainListState createState() => _PainListState();
}

class _PainListState extends State<PainList> {
  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<List<Notes>>(context) ?? [];

    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return PainTile(notes: notes[index]);
      },
    );
  }
}
