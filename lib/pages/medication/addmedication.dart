import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddMedication extends StatefulWidget {
  @override
  _AddMedicationState createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  final _formkey = GlobalKey<FormState>();
  var _medicineOptions = [
    "Pill/Tablets/Capsule",
    "Tablespoon",
    "milligram (mg)"
  ];
  var _interval = [
    'Once per Day (24 hours)',
    'Twice per Day (12 hours)',
    '3 times per Day (8 hours)',
    '4 times per Day (6 hours)'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          title: Text('Add New Medicine'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FormBuilder(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: <Widget>[
                FormBuilderTextField(
                  name: 'medicine name',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.min(context, 3),
                  ]),
                  decoration: InputDecoration(
                    labelText: 'Medicine Name',
                    hintText: 'Example: Panadol',
                  ),
                ),
                FormBuilderDropdown(
                  name: 'type',
                  decoration: InputDecoration(
                    labelText: 'Type of Medicine',
                  ),
                  allowClear: true,
                  hint: Text('Select Medicine'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: _medicineOptions
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text('$type'),
                          ))
                      .toList(),
                ),
                FormBuilderTextField(
                  name: 'dosage',
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.numeric(context),
                    FormBuilderValidators.maxLength(context, 4)
                  ]),
                  decoration: InputDecoration(
                    labelText: 'Dosage',
                    hintText: 'Example: 1',
                  ),
                ),
                FormBuilderDateTimePicker(
                  name: 'time',
                  inputType: InputType.time,
                  decoration: InputDecoration(
                    labelText: 'Medicine Intake Time',
                  ),
                  // initialTime: TimeOfDay(hour: 8, minute: 0),
                  initialValue: DateTime.now(),
                  // enabled: true,
                ),
                FormBuilderDropdown(
                  name: 'interval',
                  decoration: InputDecoration(
                    labelText: 'Medicine Intake Interval',
                  ),
                  allowClear: true,
                  hint: Text('Select Intake Interval'),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)]),
                  items: _interval
                      .map((interval) => DropdownMenuItem(
                            value: interval,
                            child: Text('$interval'),
                          ))
                      .toList(),
                ),
                RaisedButton(child: Text('Submit'), onPressed: () {}),
              ],
            ),
          ),
        ));
  }
}
