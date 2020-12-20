//import 'package:cu_cancer/models/user.dart';

class Notes {
  final String location;
  final int scale;
  final DateTime date;
  final DateTime time;
  final String uid;
  final String description;

  Notes({
    this.location,
    this.scale,
    this.date,
    this.time,
    this.description,
    this.uid,
  });

  Map<String, dynamic> toMap(String location, int scale, String date) {
    return {
      'location': location,
      'scale': scale,
      'date': date.toString(),
      'time': time.toString(),
      'description': description,
      'userID': uid,
    };
  }

  Notes fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Notes(
        location: map['location'],
        scale: map['scale'],
        date: map['date'],
        time: map['time'],
        description: map['description'],
        uid: map['userID']);
  }

  factory Notes.fromDS(String id, Map<String, dynamic> data) {
    if (data == null) return null;

    return Notes(
      location: data['location'],
      uid: id,
      description: data['description'],
      date: DateTime(data['date']),
    );
  }
}
