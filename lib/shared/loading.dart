import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final Color myHexColor = Color(0xffA3E0DA);
  final Color myHexColor2 = Color(0xff08AE9E);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: myHexColor,
      child: Center(
        child: SpinKitPumpingHeart(
          color: myHexColor2,
          size: 50,
        ),
      ),
    );
  }
}
