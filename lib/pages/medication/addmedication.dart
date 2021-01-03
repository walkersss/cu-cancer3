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

class AddMedication extends StatefulWidget {
  @override
  _AddMedicationState createState() => _AddMedicationState();
}

class _AddMedicationState extends State<AddMedication> {
  @override
  void initState() {
    super.initState();
  }

  final List<String> _medicineOptions = [
    "Pill/Tablets/Capsule",
    "Tablespoon",
    "milligram (mg)"
  ];
  final List<String> _interval = [
    'Once per Day (24 hours)',
    'Twice per Day (12 hours)',
    '3 times per Day (8 hours)',
    '4 times per Day (6 hours)'
  ];

  final _formKey = GlobalKey<FormBuilderState>();
  final format = DateFormat.yMd();
  final format2 = DateFormat("hh:mm a");
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    Color myHexColor2 = Color(0xff08AE9E);
    String medicineName, medicineType, time, interval;
    int dosage;

    return Scaffold(
      //backgroundColor: myHexColor,
      appBar: AppBar(
        backgroundColor: myHexColor2,
        title: Text('New Medication'),
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
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      //autovalidateMode: AutovalidateMode.always,
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.min(context, 3),
                          ]),
                          decoration: InputDecoration(
                            labelText: 'Medicine Name',
                            hintText: 'Example: Panadol',
                          ),
                          onSaved: (String val) {
                            medicineName = val;
                          },
                        ),
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: 'Type of Medicine',
                            ),
                            //hint: Text('Select Medicine'),
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required(context)]),
                            items: _medicineOptions
                                .map((type) => DropdownMenuItem(
                                      value: type,
                                      child: Text('$type'),
                                    ))
                                .toList(),
                            onChanged: (val) =>
                                setState(() => medicineType = val),
                            onSaved: (val) {
                              medicineType = val;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
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
                          onSaved: (String val) {
                            dosage = int.parse(val);
                          },
                        ),
                        //dropdown
                        DateTimeField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.access_time),
                              hintText: 'Time',
                              labelText: 'Medicine Intake Time',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2))),
                          // initialTime: TimeOfDay(hour: 8, minute: 0),
                          initialValue: DateTime.now(),
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
                          // enabled: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: 'Medicine Intake Interval',
                          ),
                          //hint: Text('Select Intake Interval'),
                          validator: FormBuilderValidators.compose(
                              [FormBuilderValidators.required(context)]),
                          items: _interval
                              .map((interval) => DropdownMenuItem(
                                    value: interval,
                                    child: Text('$interval'),
                                  ))
                              .toList(),
                          onChanged: (val) => setState(() => interval = val),
                          onSaved: (val) {
                            interval = val;
                          },
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            _formKey.currentState.save();
                            if (_formKey.currentState.validate()) {
                              DatabaseServices(uid: user.uid).addMedicine(
                                  medicineName,
                                  medicineType,
                                  dosage,
                                  time,
                                  interval);
                              print(medicineName);
                              print(medicineType);
                              print(dosage);
                              print(time);
                              print(interval);
                              Navigator.pop(context);
                            } else {
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('ERROR!!!')));
                            }
                          },
                          child: Text('Add'),
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
