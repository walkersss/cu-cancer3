import 'package:cu_cancer/models/notes.dart';
import 'package:cu_cancer/models/medicine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cu_cancer/models/cell.dart';
import 'package:cu_cancer/models/appointment.dart';
//import 'package:intl/intl.dart';

class DatabaseServices {
  final String uid;
  var name;
  DatabaseServices({this.uid});
  //collection reference
  final CollectionReference cancerCollection =
      Firestore.instance.collection('cell');
  final CollectionReference notesCollection =
      Firestore.instance.collection('notes');
  final CollectionReference medicineCollection =
      Firestore.instance.collection('medicine');
  final CollectionReference appointmentCollection =
      Firestore.instance.collection('appointment');

  static const String eventsCollection = "events";
  static const String appointmentsCollection = "appointments";

  Future updateUserData(String name, String status, int age) async {
    return await cancerCollection.document(uid).setData({
      'status': status,
      'name': name,
      'age': age,
    });
  }

  Future getName() async {
    DocumentSnapshot ds =
        await Firestore.instance.collection('cell').document(uid).get();
    name = ds.data['name'];
    return name;
  }

  //cell list from snapshot
  List<Cell> _cellListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Cell(
          age: doc.data['age'] ?? 0,
          name: doc.data['name'] ?? '',
          status: doc.data['status'] ?? '');
    }).toList();
  }

  //get cell stream
  Stream<List<Cell>> get cells {
    return cancerCollection.snapshots().map(_cellListFromSnapshot);
  }

  //add notes(for now it's updating)
  Future<void> addNotes(String location, String scale, String date, String time,
      String desc) async {
    // return await notesCollection.document(uid).setData({
    await Firestore.instance.collection("notes").add({
      'location': location,
      'scale': scale,
      'date': date,
      'time': time,
      'description': desc,
    });
  }

//add notes(for now it's updating)
  Future<void> updateNotes(String location, String scale, String date,
      String time, String desc) async {
    return await notesCollection.document(uid).setData({
      //await Firestore.instance.collection("notes").add({
      'location': location,
      'scale': scale,
      'date': date,
      'time': time,
      'description': desc,
    });
  }

  Future<void> deleteNotes(DocumentSnapshot doc) async {
    await Firestore.instance
        .collection("notes")
        .document(doc.documentID)
        .delete();
  }

  //notes list from snapshot
  List<Notes> _noteListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Notes(
          location: doc.data['location'] ?? '',
          scale: doc.data['scale'] ?? '',
          date: doc.data['date'] ?? '',
          time: doc.data['time'] ?? '',
          description: doc.data['description'] ?? '');
    }).toList();
  }

  //get notes stream
  Stream<List<Notes>> get notes {
    return notesCollection.snapshots().map(_noteListFromSnapshot);
  }

  //add medicine(for now it's actually adding)
  Future<void> addMedicine(String medicineName, String medicineType, int dosage,
      String time, String interval) async {
    //return await medicineCollection.document(uid).setData({
    await Firestore.instance.collection("medicine").add({
      'medicineName': medicineName,
      'medicineType': medicineType,
      'dosage': dosage,
      'time': time,
      'interval': interval,
    });
  }

  //medicine list from snapshot
  List<Medicine> _medicineListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Medicine(
          medicineName: doc.data['medicineName'] ?? '',
          medicineType: doc.data['medicineType'] ?? '',
          dosage: doc.data['dosage'] ?? '',
          time: doc.data['time'] ?? '',
          interval: doc.data['interval'] ?? '');
    }).toList();
  }

  Stream<List<Medicine>> get medicine {
    return medicineCollection.snapshots().map(_medicineListFromSnapshot);
  }

  //add medicine(for now it's updating)
  Future<void> updateMedicine(String medicineName, String medicineType,
      int dosage, String time, String interval) async {
    return await medicineCollection.document(uid).setData({
      //await Firestore.instance.collection("medicine").add({
      'medicineName': medicineName,
      'medicineType': medicineType,
      'dosage': dosage,
      'time': time,
      'interval': interval,
    });
  }

  Future<void> deleteMedicine(DocumentSnapshot doc) async {
    await Firestore.instance
        .collection("medicine")
        .document(doc.documentID)
        .delete();
  }

  Future<void> addAppointment(
    String name,
    String type,
    String department,
    String time,
    String date,
  ) async {
    //return await appointmentCollection.document(uid).setData({
    await Firestore.instance.collection("appointment").add({
      'name': name,
      'type': type,
      'department': department,
      'time': time,
      'date': date,
    });
  }

  List<Appointment> _appointmentListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Appointment(
          name: doc.data['name'] ?? '',
          type: doc.data['type'] ?? '',
          department: doc.data['department'] ?? '',
          time: doc.data['time'] ?? '',
          date: doc.data['date'] ?? '');
    }).toList();
  }

  Stream<List<Appointment>> get appointment {
    return appointmentCollection.snapshots().map(_appointmentListFromSnapshot);
  }

  Future<void> updateAppointment(
    String name,
    String type,
    String department,
    String time,
    String date,
  ) async {
    return await appointmentCollection.document(uid).setData({
      // await Firestore.instance.collection("appointment").add({
      'name': name,
      'type': type,
      'department': department,
      'time': time,
      'date': date,
    });
  }

  Future<void> deleteAppointment(DocumentSnapshot doc) async {
    await Firestore.instance
        .collection("appointment")
        .document(doc.documentID)
        .delete();
  }
}
