import 'package:flutter/material.dart';
import 'package:cu_cancer/models/notes.dart';
import 'package:cu_cancer/models/user.dart';
import 'package:provider/provider.dart';

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
        color: Color(0xffF6EC87),
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(7, 5, 7, 0),
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
                    style: TextButton.styleFrom(primary: Colors.blue[700]),
                    child: const Text('Update & Delete'),
                    onPressed: () {
                      print("Update Pressed");
                      Navigator.pushNamed(context, '/updatePain');
                    },
                  ),
                  //const SizedBox(width: 8),
                  //TextButton(
                  //  style: TextButton.styleFrom(primary: Colors.red[700]),
                  //  child: const Text('Delete'),
                  //  onPressed: () {
                  //    print("Delete Pressed");
                  //  },
                  //),
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
