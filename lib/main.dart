import 'package:cu_cancer/pages/medication/medicationHome.dart';
import 'package:flutter/material.dart';
import 'package:cu_cancer/pages/wrapper.dart';
import 'package:cu_cancer/models/user.dart';
import 'package:cu_cancer/services/auth.dart';
//import 'package:cu_cancer/loading.dart';
//import 'package:cu_cancer/pages/home/home.dart';
import 'package:cu_cancer/pages/appointment/appointmentHome.dart';
import 'package:cu_cancer/pages/pain/painHome.dart';
import 'package:cu_cancer/pages/log_report.dart';
import 'package:cu_cancer/pages/pain/painAdd.dart';
import 'package:cu_cancer/pages/medication/addmedication.dart';
import 'package:cu_cancer/pages/medication/viewmedication.dart';
import 'package:cu_cancer/pages/appointment/showAppointment.dart';
import 'package:cu_cancer/pages/appointment/addEvent.dart';
import 'package:cu_cancer/pages/pain/pain_display.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:flutter_local_notifications_extended/flutter_local_notifications_extended.dart';
import 'package:provider/provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//  FlutterLocalNotificationsPlugin();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: {
          '/medicationHome': (context) => Medication(),
          '/appointmentHome': (context) => AppointmentHome(),
          '/painHome': (context) => Pain(),
          '/logReport': (context) => LogReport(),
          '/painAdd': (context) => PainAdd(),
          '/addmedication': (context) => AddMedication(),
          '/viewmedication': (context) => ViewMedication(),
          '/appointment': (context) => ViewAppointment(),
          '/addEvent': (context) => AddEvent(),
          '/viewNote': (context) => PainDisplay(),
          '/viewMedication': (context) => ViewMedication(),
        },
        localizationsDelegates: [
          FormBuilderLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''),
          Locale('es', ''),
          Locale('fr', ''),
        ],
      ),
    );
  }
}
/*initialRoute: '/',
    //home: Home(),
    routes: {
      //base route, first screen goes to loading screen
      '/': (context) => Home(),
      //'/home': (context) => Home(),
      '/medicationHome': (context) => Medication(),
      '/appointmentHome': (context) => Appointment(),
      '/painHome': (context) => Pain(),
      '/logReport': (context) => LogReport(),
    },*/

/*Future<void> _showNotification() async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      0, 'plain title', 'plain body', platformChannelSpecifics,
      payload: 'item x');
}

Future<void> _scheduleNotification() async {
  var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 5));
var androidPlatformChannelSpecifics =
    AndroidNotificationDetails('your other channel id',
        'your other channel name', 'your other channel description');
var iOSPlatformChannelSpecifics =
    IOSNotificationDetails();
NotificationDetails platformChannelSpecifics = NotificationDetails(
    androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
await flutterLocalNotificationsPlugin.schedule(
    0,
    'scheduled title',
    'scheduled body',
    scheduledNotificationDateTime,
    platformChannelSpecifics);
}

Future<void> _showDailyAtTime() async {
    var time = Time(10, 0, 0);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name',
        'repeatDailyAtTime description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtDayAndTime(
        0,
        'show daily title',
        'Daily notification shown at approximately ${_toTwoDigitString(time.hour)}:${_toTwoDigitString(time.minute)}:${_toTwoDigitString(time.second)}',
        Day.Saturday,
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
            18, 16, 0, 0, 0),
        time,
        platformChannelSpecifics);
  }
  String _toTwoDigitString(int value) {
    return value.toString().padLeft(2, '0');
  }*/

//ltk sblm build widget
/*FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  var initializationSettingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification);
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: selectNotification);*/
