import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  final DateTime selectedDate;

  const AddEvent({Key key, this.selectedDate}) : super(key: key);
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
                name: "department",
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Choose Department(s) Involved ",
                    prefixIcon: Icon(Icons.sensor_door_rounded)),
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
                ),
                // initialTime: TimeOfDay(hour: 8, minute: 0),
                initialValue: DateTime.now(),
                // enabled: true,
              ),
              Divider(),
              FormBuilderDateTimePicker(
                name: 'date',
                initialValue: widget.selectedDate ?? DateTime.now(),
                fieldHintText: "Add Date",
                inputType: InputType.date,
                decoration: InputDecoration(
                    labelText: 'Appointment Date',
                    prefixIcon: Icon(Icons.date_range)),
                format: DateFormat('EEEE, dd MMMM, yyyy'),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () async {},
                child: Text("Submit"),
              )
            ],
          ))
        ],
      ),
    );
  }
}
