import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Image(
        image: AssetImage('assets/buwung.jpg'),
      ),
    );
  }
}
