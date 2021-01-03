import 'package:flutter/material.dart';
import 'package:cu_cancer/shared/all_display.dart';

class LogReport extends StatefulWidget {
  @override
  _LogReportState createState() => _LogReportState();
}

class _LogReportState extends State<LogReport> {
  @override
  Widget build(BuildContext context) {
    Color myHexColor = Color(0xffA3E0DA);
    Color myHexColor2 = Color(0xff08AE9E);
    //final notes = Provider.of<List<Notes>>(context) ?? [];
    //final medicine = Provider.of<List<Medicine>>(context) ?? [];
    return DefaultTabController(
        // The number of tabs / content sections to display.
        length: 3,
        child: Scaffold(
            backgroundColor: myHexColor,
            appBar: AppBar(
              title: Text('Log Report'),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.local_pharmacy)),
                  Tab(icon: Icon(Icons.calendar_today)),
                  Tab(icon: Icon(Icons.create)),
                ],
              ),
              backgroundColor: myHexColor2,
              //title: Text('Log Report'),
              elevation: 0,
            ),
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/medicalbg.jpg'),
                      fit: BoxFit.cover)),
              child: TabBarView(
                children: [ViewMedication(), ViewAppointment(), PainDisplay()],
              ),
            )));
  }
}
