import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cu_cancer/models/cell.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference cancerCollection =
      Firestore.instance.collection('cell');

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
}
