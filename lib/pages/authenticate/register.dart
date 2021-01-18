import 'package:cu_cancer/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:cu_cancer/services/auth.dart';
import 'package:cu_cancer/shared/loading.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final Color myHexColor = Color(0xffA3E0DA);
  final Color myHexColor2 = Color(0xff08AE9E);

  final List<String> status = ['Patient', 'Survivor', 'Guardian'];

  String name = '';
  String currentStatus;
  int age;
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: myHexColor,
            appBar: AppBar(
              backgroundColor: myHexColor2,
              elevation: 0.0,
              title: Text('Register to C U Cancer'),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      //Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: DetailScreen()));
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Sign In'))
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/bg-cover2.jpg'),
                          fit: BoxFit.fill)),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 35),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image(
                                        width: 170,
                                        height: 170,
                                        image: AssetImage(
                                            'assets/ic_launcher.png'),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'Name'),
                                  validator: (val) => val.length < 2
                                      ? 'Please enter name'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => name = val);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'Age'),
                                  validator: (val) => val.length == 0
                                      ? 'Please enter age'
                                      : null,
                                  onChanged: (age) {
                                    setState(() => age = age);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          DropdownButtonFormField(
                            decoration: textInputDecoration,
                            //value: currentStatus,
                            hint: Text('survivor/patients/guardian'),
                            items: status.map((status) {
                              return DropdownMenuItem(
                                  value: status, child: Text('$status'));
                            }).toList(),
                            onChanged: (val) =>
                                setState(() => currentStatus = val),
                            onSaved: (String val) {
                              currentStatus = val;
                            },
                          ),
                          /*TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText:
                                    'status: survivor, patients, guardian'),
                            validator: (val) =>
                                val.length < 6 ? 'Please enter status' : null,
                            onChanged: (val) {
                              setState(() => status = val);
                            },
                          ),*/
                          SizedBox(
                            height: 17,
                          ),
                          TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Email'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password'),
                            validator: (val) => val.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                              color: Colors.pink[400],
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result =
                                      await _auth.registerWithEmailandpassword(
                                          name,
                                          currentStatus,
                                          age,
                                          email,
                                          password);
                                  if (result == null) {
                                    setState(() {
                                      error = 'please supply a valid emai';
                                      loading = false;
                                      print(result);
                                    });
                                  }
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          )
                        ],
                      ))),
            ),
          );
  }
}
