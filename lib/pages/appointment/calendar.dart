import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarCard extends StatefulWidget {
  @override
  _CalendarCardState createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
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
      body: SingleChildScrollView(
        child: Container(
          child: Card(
            child: TableCalendar(
                events: _events,
                calendarController: _calendarController,
                calendarStyle: CalendarStyle(
                    todayColor: Colors.teal[700],
                    selectedColor: Colors.blue[100],
                    selectedStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
        ),
      ),
    );
  }
}
