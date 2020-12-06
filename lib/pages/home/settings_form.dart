import 'package:flutter/material.dart';
import 'package:cu_cancer/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> status = ['Survivor', 'Patients', 'Guardian'];

  //form values
  String _currentName;
  String _currentStatus;
  int _currentAge;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Text(
              'Update your profile.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: textInputDecoration,
              validator: (val) => val.isEmpty ? 'Please enter name' : null,
              onChanged: (val) => setState(() => _currentName = val),
            ),
            SizedBox(
              height: 20,
            ),
            //dropdown
            DropdownButtonFormField(
                decoration: textInputDecoration,
                value: _currentStatus ?? 'Survivor',
                items: status.map((status) {
                  return DropdownMenuItem(
                      value: status, child: Text('$status'));
                }).toList(),
                onChanged: (val) => setState(() => _currentStatus = val)),
            //slider
            Slider(
              min: 1,
              max: 100,
              divisions: 100,
              value: (_currentAge ?? 100).toDouble(),
              activeColor: Colors.brown[_currentAge ?? 100],
              inactiveColor: Colors.brown,
              onChanged: (val) => setState(() => _currentAge = val.round()),
            ),
            RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print(_currentName);
                  print(_currentStatus);
                  print(_currentAge);
                }),
          ],
        ));
  }
}
