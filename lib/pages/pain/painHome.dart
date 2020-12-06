import 'package:flutter/material.dart';

class Pain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color myHexColor2 = Color(0xff08AE9E);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myHexColor2,
        title: Text('Pain Notes'),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/medicalbg.jpg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            OutlinedButton.icon(
                              onPressed: () {
                                print('pressed');
                              },
                              label: Text(
                                'View Notes',
                                textAlign: TextAlign.end,
                              ),
                              icon: Icon(Icons.arrow_right),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.hovered))
                                        return Colors.blue.withOpacity(0.04);
                                      if (states.contains(
                                              MaterialState.focused) ||
                                          states
                                              .contains(MaterialState.pressed))
                                        return myHexColor2.withOpacity(0.12);
                                      return null; // Defer to the widget's default.
                                    },
                                  )),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            OutlinedButton.icon(
                              onPressed: () {
                                print('pressed');
                                Navigator.pushNamed(context, '/painAdd');
                              },
                              label: Text(
                                'New Notes',
                                textAlign: TextAlign.end,
                              ),
                              icon: Icon(Icons.arrow_right),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.hovered))
                                        return Colors.blue.withOpacity(0.04);
                                      if (states.contains(
                                              MaterialState.focused) ||
                                          states
                                              .contains(MaterialState.pressed))
                                        return myHexColor2.withOpacity(0.12);
                                      return null; // Defer to the widget's default.
                                    },
                                  )),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
