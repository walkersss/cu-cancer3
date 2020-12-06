import 'package:flutter/material.dart';
import 'package:cu_cancer/pages/home/settings_form.dart';
import 'package:cu_cancer/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:cu_cancer/models/cell.dart';
import 'package:cu_cancer/services/database.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final Color myHexColor = Color(0xffA3E0DA);
  final Color myHexColor2 = Color(0xff08AE9E);
  @override
  Widget build(BuildContext context) {
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

    return StreamProvider<List<Cell>>.value(
        value: DatabaseService().cells,
        child: Scaffold(
            backgroundColor: myHexColor,
            appBar: AppBar(
              title: Text('C U Cancer'),
              backgroundColor: myHexColor2,
              elevation: 0,
              actions: <Widget>[
                FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('Log Out'),
                    onPressed: () async {
                      await _auth.signOut();
                    }),
                FlatButton.icon(
                    onPressed: () => _showSettingspanel(),
                    icon: Icon(Icons.settings),
                    label: Text('settings'))
              ],
            ),
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/medicalbg.jpg'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 65, 0, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/buwung.jpg'),
                            radius: 55,
                          ),
                        ),
                        Text(
                          'NAME: Buwung Puyuh',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'STATUS: SURVIVOR',
                          style: TextStyle(
                              color: myHexColor2,
                              letterSpacing: 2,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                          child: LinearPercentIndicator(
                            //width: 140.0,
                            lineHeight: 15.0,
                            percent: 0.5,
                            center: Text(
                              "50.0%",
                              style: new TextStyle(fontSize: 12.0),
                            ),
                            trailing: Icon(Icons.stars),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            backgroundColor: Colors.grey,
                            progressColor: myHexColor2,
                          ),
                        ),
                        Divider(
                          height: 40,
                          color: Colors.black,
                        ),
                        //SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton.icon(
                                onPressed: () {
                                  print('pressed');
                                  Navigator.pushNamed(
                                      context, '/medicationHome');
                                },
                                icon: Icon(Icons.local_pharmacy),
                                label: Text('Medication')),
                            FlatButton.icon(
                                onPressed: () {
                                  print('pressed');
                                  Navigator.pushNamed(
                                      context, '/appointmentHome');
                                },
                                icon: Icon(Icons.calendar_today),
                                label: Text('Appointment'))
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton.icon(
                                onPressed: () {
                                  print('pressed');
                                  Navigator.pushNamed(context, '/painHome');
                                },
                                icon: Icon(Icons.create),
                                label: Text('Pain Notes')),
                            FlatButton.icon(
                                onPressed: () {
                                  print('pressed');
                                  Navigator.pushNamed(context, '/logReport');
                                },
                                icon: Icon(Icons.assessment),
                                label: Text('Log Report'))
                          ],
                        ),
                      ]),
                ),
              ),
            )));
  }
}

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   Color myHexColor = Color(0xffA3E0DA);
//   Color myHexColor2 = Color(0xff08AE9E);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: myHexColor2,
//       body: SafeArea(
//         child: Container(
//           /*decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/culogo.jpg'), fit: BoxFit.contain)),*/
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(0, 65, 0, 0),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Center(
//                     child: CircleAvatar(
//                       backgroundImage: AssetImage('assets/buwung.jpg'),
//                       radius: 55,
//                     ),
//                   ),
//                   Divider(
//                     height: 60,
//                     color: Colors.black,
//                   ),
//                   Text(
//                     'NAME: Buwung Puyuh',
//                     style: TextStyle(
//                       color: Colors.black,
//                       letterSpacing: 2,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   Text(
//                     'STATUS: SURVIVOR',
//                     style: TextStyle(
//                         color: myHexColor,
//                         letterSpacing: 2,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 50),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       FlatButton.icon(
//                           onPressed: () {
//                             print('pressed');
//                             Navigator.pushNamed(context, '/medicationHome');
//                           },
//                           icon: Icon(Icons.local_pharmacy),
//                           label: Text('Medication')),
//                       FlatButton.icon(
//                           onPressed: () {
//                             print('pressed');
//                             Navigator.pushNamed(context, '/appointmentHome');
//                           },
//                           icon: Icon(Icons.calendar_today),
//                           label: Text('Appointment'))
//                     ],
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       FlatButton.icon(
//                           onPressed: () {
//                             print('pressed');
//                             Navigator.pushNamed(context, '/painHome');
//                           },
//                           icon: Icon(Icons.create),
//                           label: Text('Pain Notes')),
//                       FlatButton.icon(
//                           onPressed: () {
//                             print('pressed');
//                             Navigator.pushNamed(context, '/logReport');
//                           },
//                           icon: Icon(Icons.assessment),
//                           label: Text('Log Report'))
//                     ],
//                   ),
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
