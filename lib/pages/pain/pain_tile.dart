import 'package:flutter/material.dart';
import 'package:cu_cancer/models/notes.dart';
import 'package:cu_cancer/services/database.dart';
import 'package:cu_cancer/models/user.dart';
import 'package:cu_cancer/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PainTile extends StatelessWidget {
  final Notes notes;

  PainTile({this.notes});

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 15,
        color: Color(0xfff0e037),
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.description_outlined),
              title: Text('Date: ${notes.date}   Time: ${notes.time}'),
              subtitle: Text('Location: '
                  '${notes.location}'
                  ', Scale: '
                  '${notes.scale}'
                  ', Notes: '
                  '${notes.description}'),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextButton(
                    child: const Text('Update & Delete'),
                    onPressed: () {
                      print("Update Pressed");
                      Navigator.pushNamed(context, '/updatePain');
                    },
                  ),
                  const SizedBox(width: 8),
                  //TextButton(
                  //  style: ButtonStyle(),
                  //  child: const Text('Delete'),
                  //  onPressed: () {
                  //    print("Delete Pressed");
                  // DatabaseServices(uid: user.uid).deleteNotes(doc.ID);
                  //  },
                  //  ),
                ]),
          ],
        ),
      ),
    );
  }
}
