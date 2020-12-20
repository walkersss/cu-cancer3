import 'package:flutter/material.dart';
//import 'package:cu_cancer/pages/medication/addmedication.dart';
//import 'package:cu_cancer/pages/medication/viewmedication.dart';

class Medication extends StatefulWidget {
  @override
  _MedicationState createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  @override
  Widget build(BuildContext context) {
    //Color myHexColor = Color(0xffA3E0DA);
    Color myHexColor2 = Color(0xff08AE9E);
    return Scaffold(
      //backgroundColor: myHexColor,
      appBar: AppBar(
        backgroundColor: myHexColor2,
        title: Text('Medication Reminder'),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/medicalbg.jpg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            OutlinedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/viewmedication');
                              },
                              label: Text(
                                'View Medication',
                                textAlign: TextAlign.end,
                              ),
                              icon: Icon(Icons.arrow_right),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.hovered))
                                        return Colors.blue.withOpacity(0.04);
                                      if (states.contains(
                                              MaterialState.focused) ||
                                          states
                                              .contains(MaterialState.pressed))
                                        return myHexColor2.withOpacity(0.12);
                                      return null; // Defer to the widget's default.
                                    },
                                  )),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            OutlinedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/addmedication');
                              },
                              label: Text(
                                'Add New Medication',
                                textAlign: TextAlign.end,
                              ),
                              icon: Icon(Icons.arrow_right),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.hovered))
                                        return Colors.blue.withOpacity(0.04);
                                      if (states.contains(
                                              MaterialState.focused) ||
                                          states
                                              .contains(MaterialState.pressed))
                                        return myHexColor2.withOpacity(0.12);
                                      return null; // Defer to the widget's default.
                                    },
                                  )),
                            ),
                          ]),
                      /*Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton.icon(
                                  onPressed: () {
                                    print('pressed');
                                  },
                                  label: Text(
                                    'Edit Medication',
                                    textAlign: TextAlign.end,
                                  ),
                                  icon: Icon(Icons.arrow_right)),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton.icon(
                                  onPressed: () {
                                    print('pressed');
                                  },
                                  label: Text(
                                    'Delete Medication',
                                    textAlign: TextAlign.start,
                                  ),
                                  icon: Icon(Icons.arrow_right)),
                            ])*/
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
