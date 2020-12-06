import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cu_cancer/shared/constants.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class PainAdd extends StatefulWidget {
  @override
  _PainAddState createState() => _PainAddState();
}

class _PainAddState extends State<PainAdd> {
  CalendarController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  final _formKey = GlobalKey<FormBuilderState>();
  bool autovalidate;
  final format = DateFormat.yMd();
  final format2 = DateFormat.jm();
  @override
  Widget build(BuildContext context) {
    //Color myHexColor = Color(0xffA3E0DA);
    Color myHexColor2 = Color(0xff08AE9E);
    String _currentScale = '0';
    return Scaffold(
      //backgroundColor: myHexColor,
      appBar: AppBar(
        backgroundColor: myHexColor2,
        title: Text('New Notes'),
        elevation: 0,
      ),
      body: Container(
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
                    //autovalidate: true,
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: painInputDecoration,
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
                          //value: _currentScale,
                          items: scale.map((scale) {
                            return DropdownMenuItem(
                                value: scale, child: Text('$scale'));
                          }).toList(),
                          onChanged: (val) =>
                              setState(() => _currentScale = val)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Date & Time',
                        style: TextStyle(fontSize: 15),
                      ),
                      TableCalendar(
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
                          calendarController: _controller),
                      DateTimeField(
                        decoration: InputDecoration(
                            hintText: 'Time',
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2))),
                        format: format2,
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
                      TextField(
                        decoration: morePainInputDecoration,
                      ),
                      /* FormBuilderFilterChip(
                        name: 'filter_chip',
                        decoration: InputDecoration(
                          labelText: 'Select many options',
                        ),
                        options: [
                          FormBuilderFieldOption(
                              value: 'Test', child: Text('Test')),
                          FormBuilderFieldOption(
                              value: 'Test 1', child: Text('Test 1')),
                          FormBuilderFieldOption(
                              value: 'Test 2', child: Text('Test 2')),
                          FormBuilderFieldOption(
                              value: 'Test 3', child: Text('Test 3')),
                          FormBuilderFieldOption(
                              value: 'Test 4', child: Text('Test 4')),
                        ],
                      ), */
                      ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.

                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
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
    );
  }
}
