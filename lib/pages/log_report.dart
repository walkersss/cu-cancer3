import 'package:flutter/material.dart';

class LogReport extends StatefulWidget {
  @override
  _LogReportState createState() => _LogReportState();
}

class _LogReportState extends State<LogReport> {
  @override
  Widget build(BuildContext context) {
    Color myHexColor = Color(0xffA3E0DA);
    Color myHexColor2 = Color(0xff08AE9E);
    return Scaffold(
        backgroundColor: myHexColor,
        appBar: AppBar(
          backgroundColor: myHexColor2,
          title: Text('Log Report'),
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/medicalbg.jpg'),
                  fit: BoxFit.cover)),
        ));
  }
}
