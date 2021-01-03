import 'package:cu_cancer/models/appointment.dart';
import 'package:cu_cancer/services/database.dart';
import 'package:firebase_helpers/firebase_helpers.dart';

DatabaseService<Appointment> eventDBS = DatabaseService<Appointment>(
    DatabaseServices.appointmentsCollection,
    toMap: (appointment) => appointment.toMap(),
    fromDS: (id, data) => Appointment.fromDS(id, data));
