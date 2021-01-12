//import 'dart:js';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cu_cancer/pages/home/profile.dart';
import 'package:cu_cancer/services/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:cu_cancer/models/cell.dart';
import 'package:cu_cancer/services/database.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  final Color myHexColor = Color(0xffA3E0DA);

  final Color myHexColor2 = Color(0xff08AE9E);

  PickedFile _imageFile;

  final ImagePicker _picker = ImagePicker();

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
        value: DatabaseServices().cells,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                        image: AssetImage('assets/bg-cover2.jpg'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Stack(children: <Widget>[
                            CircleAvatar(
                              backgroundImage: _imageFile == null
                                  ? AssetImage('assets/ic_launcher.png')
                                  : FileImage(File(_imageFile.path)),
                              radius: 70,
                            ),
                            Positioned(
                                bottom: 15.0,
                                right: 15.0,
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: ((builder) =>
                                          bottomSheet(context)),
                                    );
                                  },
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.teal,
                                    size: 25.0,
                                  ),
                                ))
                          ]),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'NAME: (Name)',
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
                          padding: const EdgeInsets.fromLTRB(13, 8, 13, 10),
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
                                color: Color(0xff30a9e6),
                                onPressed: () {
                                  print('pressed');
                                  Navigator.pushNamed(
                                      context, '/medicationHome');
                                },
                                icon: Icon(Icons.local_pharmacy),
                                label: Text('Medication')),
                            FlatButton.icon(
                                color: Color(0xfffa8b2a),
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
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton.icon(
                                color: Color(0xffa12aeb),
                                onPressed: () {
                                  print('pressed');
                                  Navigator.pushNamed(context, '/logReport');
                                },
                                icon: Icon(Icons.assessment),
                                label: Text('Log Report')),
                            FlatButton.icon(
                                color: Color(0xfff0e037),
                                onPressed: () {
                                  print('pressed');
                                  Navigator.pushNamed(context, '/painHome');
                                },
                                icon: Icon(Icons.create),
                                label: Text('Pain Notes'))
                          ],
                        ),
                      ]),
                ),
              ),
            )));
  }

  Widget bottomSheet(context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text('Choose profile photo', style: TextStyle(fontSize: 20.0)),
          SizedBox(
            height: 2.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text('Camera'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
                label: Text('Gallery'),
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
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
