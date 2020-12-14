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
            Card(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.all(8.0),
              child: TableCalendar(
                  calendarController: _calendarController,
                  calendarStyle: CalendarStyle(
                      todayColor: Colors.teal[700],
                      selectedColor: Colors.blue[100],
                      selectedStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                      todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                      )),
                  headerStyle: HeaderStyle(
                    formatButtonShowsNext: false,
                    headerMargin: const EdgeInsets.only(bottom: 8.0),
                    formatButtonDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(color: Colors.teal[400]),
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  builders: CalendarBuilders(
                    selectedDayBuilder: (context, date, events) =>
                        Text(date.day.toString()),
                  )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/addEvent');
        },
      ),
    );
  }
}
