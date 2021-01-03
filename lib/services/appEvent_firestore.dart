import 'package:cu_cancer/models/app_event.dart';
import 'package:cu_cancer/services/database.dart';
import 'package:firebase_helpers/firebase_helpers.dart';

DatabaseService<AppEvent> eventDBS = DatabaseService<AppEvent>(
    DatabaseServices.eventsCollection,
    toMap: (user) => user.toMap(),
    fromDS: (id, data) => AppEvent.fromMap(data));
