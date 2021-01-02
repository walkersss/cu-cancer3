import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cu_cancer/shared/constants.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
//import 'package:table_calendar/table_calendar.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:cu_cancer/services/database.dart';
//import 'package:cu_cancer/models/notes.dart';
import 'package:provider/provider.dart';
import 'package:cu_cancer/models/user.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class PainAdd extends StatefulWidget {
  @override
  _PainAddState createState() => _PainAddState();
}

class _PainAddState extends State<PainAdd> {
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
    User user = Provider.of<User>(context);

    return Scaffold(
      //backgroundColor: myHexColor,
      appBar: AppBar(
        backgroundColor: myHexColor2,
        title: Text('New Notes'),
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
                        Text(
                          'Location:',
                          style: TextStyle(fontSize: 15),
                        ),
                        DropdownButtonFormField(
                          decoration: textInputDecoration,
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Scale of Pain:',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text('1-mild, 5- severe'),
                        //dropdown
                        DropdownButtonFormField(
                          decoration: textInputDecoration,
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Date & Time',
                          style: TextStyle(fontSize: 15),
                        ),
                        DateTimePicker(
                          type: DateTimePickerType.date,
                          initialValue: '',
                          firstDate: DateTime(2019),
                          lastDate: DateTime(2025),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Date',
                          onChanged: (val) => print(val),
                          onSaved: (val) => date = val,
                        ),
                        DateTimeField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.access_time),
                              hintText: 'Time',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2))),
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
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: morePainInputDecoration,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.maxLength(context, 200),
                          ]),
                          onSaved: (String val) {
                            desc = val;
                          },
                        ),
                        ElevatedButton(
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

/*TableCalendar(
                            initialCalendarFormat: CalendarFormat.week,
                            calendarStyle: CalendarStyle(
                                todayColor: Colors.orange,
                                selectedColor: myHexColor2,
                                todayStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white)),
                            headerStyle: HeaderStyle(
                              centerHeaderTitle: true,
                              formatButtonDecoration: BoxDecoration(
                                color: myHexColor2,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              formatButtonTextStyle:
                                  TextStyle(color: Colors.white),
                              formatButtonShowsNext: false,
                            ),
                            //startingDayOfWeek: StartingDayOfWeek.monday,
                            onDaySelected: (date, events, _) {
                              print(date.toIso8601String());
                            },
                            builders: CalendarBuilders(
                              selectedDayBuilder: (context, date, events) =>
                                  Container(
                                margin: const EdgeInsets.all(4.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: myHexColor2,
                                  borderRadius: BorderRadius.circular(10.0),
                                  //shape: BoxShape.circle
                                ),
                                child: Text(date.day.toString(),
                                    style: TextStyle(color: Colors.white)),
                              ),
                              todayDayBuilder: (context, date, events) =>
                                  Container(
                                margin: const EdgeInsets.all(4.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10.0),
                                  //shape: BoxShape.circle
                                ),
                                child: Text(date.day.toString(),
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                            calendarController: _controller),*/
