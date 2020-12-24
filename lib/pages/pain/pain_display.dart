import 'package:flutter/material.dart';
import 'package:cu_cancer/models/notes.dart';
import 'package:cu_cancer/pages/pain/pain_List.dart';
import 'package:cu_cancer/services/database.dart';
import 'package:provider/provider.dart';

class PainDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color myHexColor2 = Color(0xff08AE9E);
    return StreamProvider<List<Notes>>.value(
      value: DatabaseService().notes,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: myHexColor2,
            title: Text('Your Notes'),
            elevation: 0,
          ),
          body: PainList()),
    );
  }
}
