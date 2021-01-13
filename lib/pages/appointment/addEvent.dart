import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:cu_cancer/models/app_event.dart';
import 'package:cu_cancer/services/appEvent_firestore.dart';
import 'package:cu_cancer/models/user.dart';
//import 'package:riverpod/riverpod.dart';
import 'package:provider/provider.dart';
import 'package:date_time_picker/date_time_picker.dart';
//import 'package:firebasestarter/core/presentation/providers/providers.dart';

class AddEvent extends StatefulWidget {
  final DateTime selectedDate;
  final AppEvent event;

  const AddEvent({Key key, this.selectedDate, this.event}) : super(key: key);
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  Color myHexColor2 = Color(0xff08AE9E);
  final _formKey = GlobalKey<FormBuilderState>();
  final format = DateFormat.yMd();
  final format2 = DateFormat("hh:mm a");
  FocusNode myFocusNode;
  var _types = [
    "Medication Resupply",
    "Medication Session",
    "Follow-Up",
    "Treatment Session",
    "Surgery",
    "Primary Care",
    "Rehabilitation"
  ];

  List<String> _department = [
    "Dermatology",
    "Dietitian",
    "Gynecology",
    "Hermatology",
    "Internal Medicine",
    "Neuorology",
    "Neurosurgeon",
    "Oncologist",
    "Orthopedic",
    "Pain specialist",
    "Palliative Care",
    "Pediatrician",
    "Pharmacy",
    "Physical Therapist",
    "Plastic Surgeon",
    "Primary Care",
    "Psychiatrist",
    "Psychologist",
    "Urologist",
  ];

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    String name, type, department, time, date;
    myFocusNode = FocusNode();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('New Appointment'),
        backgroundColor: Colors.teal[400],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/medicalbg.jpg'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: FormBuilder(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Title should not be empty";
                            }
                            return null;
                          },
                          autofocus: true,
                          name: "name",
                          decoration: InputDecoration(
                            labelText: 'Appointment Name',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "Example: 2nd Appointment",
                            hintStyle: TextStyle(
                                color: Colors.grey[800],
                                fontStyle: FontStyle.italic),
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
                            contentPadding: const EdgeInsets.only(left: 48.0),
                          ),
                          onSaved: (String val) {
                            name = val;
                          },
                        ),
                        Divider(),
                        FormBuilderDropdown(
                          name: "type",
                          decoration: InputDecoration(
                            hintText: "Choose Type of Appointment",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                            prefixIcon: Icon(Icons.calendar_view_day),
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
                          allowClear: true,
                          items: _types
                              .map((type) => DropdownMenuItem(
                                    value: type,
                                    child: Text('$type'),
                                  ))
                              .toList(),
                          onSaved: (String val) {
                            type = val;
                          },
                        ),
                        Divider(),
                        Text(
                          'Choose Department(s) Involved',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        FormBuilderFilterChip(
                          name: "department",
                          elevation: 1.0,
                          pressElevation: 2.5,
                          backgroundColor: Colors.white,
                          selectedColor: Colors.green,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            //labelText: "Choose Department(s) Involved ",
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.sensor_door_rounded),
                          ),
                          options: _department
                              .map((department) => FormBuilderFieldOption(
                                    value: department,
                                    child: Text('$department'),
                                  ))
                              .toList(),
                        ),
                        Divider(),
                        FormBuilderDateTimePicker(
                          name: 'time',
                          inputType: InputType.time,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.time_to_leave),
                            labelText: 'Appointment Time',
                            labelStyle: TextStyle(color: Colors.black),
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
                          // initialTime: TimeOfDay(hour: 8, minute: 0),
                          initialValue: DateTime.now(),
                          format: DateFormat('jms'),
                          onSaved: (val) => DateFormat.jm().format(val),
                          // enabled: true,
                        ),
                        Divider(),
                        FormBuilderDateTimePicker(
                          validator: FormBuilderValidators.compose(
                              [FormBuilderValidators.required(context)]),
                          name: 'date',
                          initialValue: widget.selectedDate ?? DateTime.now(),
                          fieldHintText: "Add Date",
                          inputType: InputType.date,
                          decoration: InputDecoration(
                            labelText: 'Appointment Date',
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.date_range),
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
                          format: DateFormat('EEEE, MM/dd/yyyy'),
                          onSaved: (val) => DateFormat.yMMMd().format(val),
                        ),
                        Divider(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: myHexColor2,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            bool validated = _formKey.currentState.validate();
                            if (validated) {
                              _formKey.currentState.save();
                              final data = Map<String, dynamic>.from(
                                  _formKey.currentState.value);
                              //  data['time'] =
                              //      (data['time'] as DateTime).millisecondsSinceEpoch;
                              //data['user_id'] =
                              //   context.read(userRepoProvider).user.id;

                              await eventDBS.create(data);

                              print(data);

                              //    if (_formKey.currentState.validate()) {
                              //      DatabaseServices(uid: user.uid).addAppointment(
                              //          name, type, department, time, date);
                              //    }
                              Navigator.pop(context);
                            }
                          },
                          child: Text("Submit"),
                        )
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
