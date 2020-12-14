import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _formKey = GlobalKey<FormBuilderState>();
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
        backgroundColor: Colors.teal[400],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          FormBuilder(
              child: Column(
            children: [
              FormBuilderTextField(
                name: "name",
                decoration: InputDecoration(
                  hintText: "Add Appointment Name",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 48.0),
                ),
              ),
              Divider(),
              FormBuilderDropdown(
                name: "type",
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Choose Type of Appointment",
                    prefixIcon: Icon(Icons.calendar_view_day)),
                allowClear: true,
                items: _types
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text('$type'),
                        ))
                    .toList(),
              ),
              Divider(),
              FormBuilderFilterChip(
                name: "type",
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Choose Type of Appointment",
                    prefixIcon: Icon(Icons.calendar_view_day)),
                options: _types
                    .map((type) => FormBuilderFieldOption(
                          value: type,
                          child: Text('$type'),
                        ))
                    .toList(),
              ),
              FormBuilderDateTimePicker(
                name: 'time',
                inputType: InputType.time,
                decoration: InputDecoration(
                  labelText: 'Appointment Time',
                ),
                // initialTime: TimeOfDay(hour: 8, minute: 0),
                initialValue: DateTime.now(),
                // enabled: true,
              ),
              FormBuilderDateTimePicker(
                name: 'date',
                inputType: InputType.date,
                decoration: InputDecoration(
                  labelText: 'Appointment Date',
                ),
                initialValue: DateTime.now(),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
