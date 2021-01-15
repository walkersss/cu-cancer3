import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
//import 'package:table_calendar/table_calendar.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:cu_cancer/services/database.dart';
//import 'package:cu_cancer/models/notes.dart';
import 'package:provider/provider.dart';
import 'package:cu_cancer/models/user.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class UpdatePain extends StatefulWidget {
  @override
  _UpdatePainState createState() => _UpdatePainState();
}

class _UpdatePainState extends State<UpdatePain> {
  @override
  void initState() {
    super.initState();
  }

  final List<String> scales = [
    '1-V. Mild',
    '2-Mild',
    '3-Moderate',
    '4-Severe',
    '5-V. Severe'
  ];
  final List<String> locations = [
    'Head',
    'Shoulder',
    'Left Hand',
    'Right Hand',
    'Left Arm',
    'Right Arm',
    'Upper Body',
    'Lower Body',
    'Legs',
    'Feet',
  ];
  final _formKey = GlobalKey<FormBuilderState>();
  final format = DateFormat.yMd();
  final format2 = DateFormat("hh:mm a");
  String location, currentScale, date, time, desc;

  @override
  Widget build(BuildContext context) {
    //Color myHexColor = Color(0xffA3E0DA);
    Color myHexColor2 = Color(0xff08AE9E);
    Color red = Color(0xffFF0000);
    User user = Provider.of<User>(context);

    return Scaffold(
      //backgroundColor: myHexColor,
      appBar: AppBar(
        backgroundColor: myHexColor2,
        title: Text('Update Notes'),
        elevation: 0,
      ),
      body: Builder(
        builder: (context) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/medicalbg.jpg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 220),
                  child: FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      //autovalidateMode: AutovalidateMode.always,
                      child: Column(children: <Widget>[
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: 'Pain Location',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                            hintText: 'Pain Location',
                            prefixIcon: Icon(Icons.accessibility),
                            contentPadding: const EdgeInsets.only(left: 5.0),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                            ),
                          ),
                          //value: currentScale,
                          items: locations.map((location) {
                            return DropdownMenuItem(
                                value: location, child: Text('$location'));
                          }).toList(),
                          onChanged: (val) => setState(() => location = val),
                          onSaved: (String val) {
                            location = val;
                          },
                        ),
                        Divider(),

                        //dropdown
                        FormBuilderDropdown(
                          name: 'location',
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.healing),
                            labelText:
                                'Scale of Pain From 1 (Mild) - 5 (Severe)',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                            hintText: 'Example: Panadol',
                            contentPadding: const EdgeInsets.only(left: 5.0),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                            ),
                          ),
                          //value: currentScale,
                          items: scales.map((scale) {
                            return DropdownMenuItem(
                                value: scale, child: Text('$scale'));
                          }).toList(),
                          onChanged: (val) =>
                              setState(() => currentScale = val),
                          onSaved: (val) {
                            currentScale = val;
                          },
                        ),
                        Divider(),

                        DateTimePicker(
                          decoration: InputDecoration(
                            labelText: 'Date of Pain',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                            prefixIcon: Icon(Icons.calendar_today),
                            contentPadding: const EdgeInsets.only(left: 48.0),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                            ),
                          ),
                          type: DateTimePickerType.date,
                          initialValue: '',
                          firstDate: DateTime(2019),
                          lastDate: DateTime(2025),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Date',
                          onChanged: (val) => print(val),
                          onSaved: (val) => date = val,
                        ),
                        Divider(),
                        DateTimeField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.access_time),
                            hintText: 'Time',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                            contentPadding: const EdgeInsets.only(left: 48.0),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                            ),
                          ),
                          format: format2,
                          onSaved: (val) => time = DateFormat.jm().format(val),
                          onShowPicker: (context, currentValue) async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ?? DateTime.now()),
                            );
                            return DateTimeField.convert(time);
                          },
                        ),
                        Divider(),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.access_time),
                            hintText: 'Additional Notes (Optional)',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                            contentPadding: const EdgeInsets.only(left: 48.0),
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.maxLength(context, 200),
                          ]),
                          onSaved: (String val) {
                            desc = val;
                          },
                        ),
                        Divider(),
                        Row(
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: myHexColor2,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              //onPressed: _sendToServer(),
                              onPressed: () async {
                                _formKey.currentState.save();
                                if (_formKey.currentState.validate()) {
                                  DatabaseServices(uid: user.uid).updateNotes(
                                      location, currentScale, date, time, desc);
                                  print(location);
                                  print(currentScale);
                                  print(date);
                                  print(time);
                                  print(desc);
                                  Navigator.pop(context);
                                } else {
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text('ERROR!!!')));
                                }
                              },
                              child: Text('Update'),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: red,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              //onPressed: _sendToServer(),
                              onPressed: () async {
                                _formKey.currentState.save();
                                if (_formKey.currentState.validate()) {
                                  DatabaseServices(uid: user.uid).addNotes(
                                      location, currentScale, date, time, desc);
                                  print(location);
                                  print(currentScale);
                                  print(date);
                                  print(time);
                                  print(desc);
                                  Navigator.pop(context);
                                } else {
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text('ERROR!!!')));
                                }
                              },
                              child: Text('Delete'),
                            ),
                          ],
                        )
                      ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
