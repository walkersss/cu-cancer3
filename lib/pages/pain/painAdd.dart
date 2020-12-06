import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cu_cancer/shared/constants.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class PainAdd extends StatefulWidget {
  @override
  _PainAddState createState() => _PainAddState();
}

class _PainAddState extends State<PainAdd> {
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
                image: AssetImage('assets/medicalbg.jpg'), fit: BoxFit.cover)),
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

                      Text(
                        'Date & Time',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text('(${format.pattern})'),
                      DateTimeField(
                        format: format,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(2019),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                      ),
                      DateTimeField(
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
