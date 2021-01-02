import 'package:flutter/material.dart';
import 'package:cu_cancer/pages/appointment/addEvent.dart';
import 'package:cu_cancer/pages/home/home.dart';

class AppRoutes {
  static const String addEvent = "/addEvent";
  static const String appointment = "/appointment";
  static const home = "/home";

  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (_) {
          switch (settings.name) {
            case addEvent:
              return AddEvent(selectedDate: settings.arguments);
            default:
              return Home();
          }
        });
  }
}
