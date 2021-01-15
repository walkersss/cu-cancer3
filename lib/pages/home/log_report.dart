import 'package:flutter/material.dart';
import 'package:cu_cancer/shared/all_display.dart';
import 'package:cu_cancer/pages/home/profile.dart';
import 'package:cu_cancer/services/auth.dart';

class LogReport extends StatefulWidget {
  @override
  _LogReportState createState() => _LogReportState();
}

class _LogReportState extends State<LogReport> {
  //PickedFile _imageFile;
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    Color myHexColor = Color(0xffA3E0DA);
    Color myHexColor2 = Color(0xff08AE9E);
    final AuthService _auth = AuthService();

    List<Widget> _widgetOptions = <Widget>[
      ViewAppointment(),
      ViewMedication(),
      PainDisplay(),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    void _showSettingspanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: SettingsForm(),
            );
          });
    }

    return Scaffold(
        backgroundColor: myHexColor,
        appBar: AppBar(
            backgroundColor: myHexColor2,
            title: Text(
              'C U Cancer',
              style: TextStyle(color: Colors.black),
            ),
            actions: <Widget>[
              PopupMenuButton<int>(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                color: myHexColor,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text("Profile"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("Sign Out"),
                  ),
                ],
                initialValue: 1,
                onCanceled: () {
                  print("Menu cancelled.");
                },
                onSelected: (value) async {
                  if (value == 1) {
                    print("value:$value");
                    return _showSettingspanel();
                  } else {
                    await _auth.signOut();
                  }
                },
              ),
            ]),
        body: IndexedStack(children: [
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          )
        ]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: myHexColor2,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Appointment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.healing_sharp),
              label: 'Medication',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_rounded),
              label: 'Notes',
            ),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
        ));
  }
}
