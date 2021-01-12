import 'package:cu_cancer/pages/authenticate/authenticate.dart';
import 'package:cu_cancer/pages/home/log_report.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cu_cancer/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return either home/authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return LogReport();
    }
  }
}
