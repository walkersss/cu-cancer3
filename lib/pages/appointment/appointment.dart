import 'appointmentHome.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class ViewAppointment extends StatefulWidget {
  @override
  _ViewAppointmentState createState() => _ViewAppointmentState();
}

class _ViewAppointmentState extends State<ViewAppointment> {
  CalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text('Add New Appointment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
                calendarController: _calendarController,
                headerStyle: HeaderStyle(formatButtonShowsNext: false),
                builders: CalendarBuilders(
                  selectedDayBuilder: (context, date, events) =>
                      Text(date.day.toString()),
                ))
          ],
        ),
      ),
    );
  }
}
