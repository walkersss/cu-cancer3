import 'package:cu_cancer/services/auth.dart';
import 'package:cu_cancer/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:cu_cancer/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final Color myHexColor = Color(0xffA3E0DA);
  final Color myHexColor2 = Color(0xff08AE9E);
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: myHexColor,
            appBar: AppBar(
              backgroundColor: myHexColor2,
              elevation: 0.0,
              title: Text('Log in to C U Cancer'),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Register'))
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/bg-cover2.jpg'),
                        fit: BoxFit.fill)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Image(
                                    width: 170,
                                    height: 170,
                                    image: AssetImage('assets/ic_launcher.png'),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 60, 5, 49),
                        child: Container(
                            alignment: Alignment.center,
                            //padding: EdgeInsets.fromLTRB(5, 25, 5, 0),
                            child: Text(
                              'Welcome to C U Cancer',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30),
                            )),
                      ),
                      Container(
                          //alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        hintText: 'Email'),
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
                                    height: 20,
                                  ),
                                  RaisedButton(
                                      color: Colors.pink[400],
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await _auth
                                              .signInWithEmailandpassword(
                                                  email, password);
                                          if (result == null) {
                                            setState(() {
                                              error = 'INVALID CREDENTIALS';
                                              loading = false;
                                            });
                                          }
                                        }
                                      }),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    error,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 14),
                                  )
                                ],
                              ))),
                    ]),
              ),
            ));
  }
}

/*RaisedButton(
            child: Text('Sign in Anon'),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print('error signing in');
              } else {
                print('Sign in success');
                print(result.uid);
              }
            },
          )*/
