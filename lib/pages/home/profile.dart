import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cu_cancer/shared/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cu_cancer/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String uid;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  final _formkey = GlobalKey<FormState>();
  final List<String> status = ['Survivor', 'Patients', 'Guardian'];

  //form values
  String _currentName;
  String _currentStatus, _currentAge;

  PickedFile _imageFile;
  final Color myHexColor2 = Color(0xff08AE9E);
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Container(
          width: double.infinity,
          height: 250,
          child: Center(
              child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                CircleAvatar(
                  backgroundImage: _imageFile == null
                      ? AssetImage('assets/ic_launcher.png')
                      : FileImage(File(_imageFile.path)),
                  radius: 50,
                ),
                Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheet(context)),
                        );
                      },
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ))
              ]),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Text(
                    //name.getName();
                    '${user?.email}',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'STATUS: SURVIVOR',
                style: TextStyle(
                    color: myHexColor2,
                    letterSpacing: 2,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              FlatButton.icon(
                  color: myHexColor2,
                  onPressed: () {
                    _openPopup(context);
                  },
                  icon: Icon(Icons.edit),
                  label: Text('Edit profile')),
            ],
          )),
        ),
      ),
    );
  }

  Widget bottomSheet(context) {
    return Column(
      children: [
        Container(
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
        ),
      ],
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

  void _openPopup(context) => Alert(
          context: context,
          title: 'Update your profile.',
          content: Column(
            children: <Widget>[
              Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Name',
                          hintStyle: TextStyle(
                              color: Colors.black, fontStyle: FontStyle.italic),
                          contentPadding: const EdgeInsets.only(left: 48.0),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
                          ),
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Please enter name' : null,
                        onChanged: (val) => setState(() => _currentName = val),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //dropdown
                      DropdownButtonFormField(
                          decoration: textInputDecoration,
                          value: _currentStatus ?? 'Survivor',
                          items: status.map((status) {
                            return DropdownMenuItem(
                                value: status, child: Text('$status'));
                          }).toList(),
                          onChanged: (val) =>
                              setState(() => _currentStatus = val)),
                      SizedBox(
                        height: 20,
                      ),
                      //slider
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Age',
                          hintStyle: TextStyle(
                              color: Colors.black, fontStyle: FontStyle.italic),
                          contentPadding: const EdgeInsets.only(left: 48.0),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
                          ),
                        ),
                        validator: (val) => val.isEmpty ? 'Age' : null,
                        onChanged: (val) => setState(() => _currentAge = val),
                      ),
                    ],
                  )),
            ],
          ),
          buttons: [
            DialogButton(
              color: myHexColor2,
              onPressed: () async {
                print(_currentName);
                print(_currentStatus);
                print(_currentAge);
                Navigator.pop(context);
              },
              child: Text(
                "Update",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]).show();
}
