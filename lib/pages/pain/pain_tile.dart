import 'package:flutter/material.dart';
import 'package:cu_cancer/models/notes.dart';

class PainTile extends StatelessWidget {
  final Notes notes;
  PainTile({this.notes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 15,
        color: Color(0xfff0e037),
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Icon(Icons.description_outlined),
          title: Text('${notes.date} ${notes.time}'),
          subtitle: Text('Location: '
              ' ${notes.location}'
              ', Scale: '
              '${notes.scale}'
              ',Notes: '
              '${notes.description}'),
        ),
      ),
    );
  }
}
