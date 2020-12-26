import 'package:cu_cancer/models/notes.dart';
import 'package:cu_cancer/models/medicine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cu_cancer/models/cell.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference cancerCollection =
      Firestore.instance.collection('cell');
  final CollectionReference notesCollection =
      Firestore.instance.collection('notes');
  final CollectionReference medicineCollection =
      Firestore.instance.collection('medicine');

  Future updateUserData(String name, String status, int age) async {
    return await cancerCollection.document(uid).setData({
      'status': status,
      'name': name,
      'age': age,
    });
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

  Future<void> addNotes(String location, String scale, String date, String time,
      String desc) async {
    return await notesCollection.document(uid).setData({
      'location': location,
      'scale': scale,
      'date': date,
      'time': time,
      'description': desc,
    });
  }

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

  Stream<List<Notes>> get notes {
    return notesCollection.snapshots().map(_noteListFromSnapshot);
  }

  Future<void> addMedicine(String medicineName, String medicineType, int dosage,
      String time, String interval) async {
    return await medicineCollection.document(uid).setData({
      'medicineName': medicineName,
      'medicineType': medicineType,
      'dosage': dosage,
      'time': time,
      'interval': interval,
    });
  }

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
    return notesCollection.snapshots().map(_medicineListFromSnapshot);
  }
}
