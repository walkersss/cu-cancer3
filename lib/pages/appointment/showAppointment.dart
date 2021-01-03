//import 'package:cu_cancer/models/app_event.dart';
//import 'package:cu_cancer/services/appEvent_firestore.dart';
//import 'package:cu_cancer/others/routes.dart';
import 'package:cu_cancer/services/database.dart';
//import 'appointmentHome.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cu_cancer/models/appointment.dart';
import 'package:cu_cancer/pages/appointment/appointmentList.dart';

class ViewAppointment extends StatefulWidget {
  @override
  _ViewAppointmentState createState() => _ViewAppointmentState();
}

class _ViewAppointmentState extends State<ViewAppointment> {
  CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _events = {};
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> encodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
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
                  events: _events,
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
                    selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.teal[300],
                        borderRadius: BorderRadius.circular(10.0),
                        //shape: BoxShape.circle
                      ),
                      child: Text(date.day.toString(),
                          style: TextStyle(color: Colors.white)),
                    ),
                    todayDayBuilder: (context, date, events) => Container(
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
                  )),
            ),
            //StreamBuilder(
            //  stream: eventDBS.streamList(),
            //  builder: (BuildContext context, AsyncSnapshot snapshot) {
            //   if (snapshot.hasData) {
            //     final events = snapshot.data;
            //     return ListView.builder(
            //         shrinkWrap: true,
            //         itemCount: events.length,
            //        itemBuilder: (BuildContext context, int index) {
            //          AppEvent event = events[index];
            //          return ListTile(title: Text(event.name));
            //        });
            //  }
            //  return CircularProgressIndicator();
            //},
            //)
            Card(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(8.0),
                child: StreamProvider<List<Appointment>>.value(
                  value: DatabaseServices().appointment,
                  child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/medicalbg.jpg'),
                              fit: BoxFit.cover)),
                      child: AppointmentList()),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //Navigator.pushNamed(context, AppRoutes.addEvent, arguments: _calendarController.selectedDay);
          Navigator.pushNamed(context, '/addEvent');
        },
      ),
    );
  }
}
