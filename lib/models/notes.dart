//import 'package:cu_cancer/models/user.dart';

class Notes {
  String location;
  String scale;
  DateTime date;
  DateTime time;
  //String uid;
  String description;

  Notes({
    this.location,
    this.scale,
    this.date,
    this.time,
    this.description,
    //this.uid,
  });

  Map<String, dynamic> toJson(String location, String scale, String date,
      String time, String description) {
    return {
      'location': location,
      'scale': scale,
      'date': date.toString(),
      'time': time.toString(),
      'description': description,
      //'userID': uid,
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
    );
    //uid: map['userID']
  }

  factory Notes.fromDS(String id, Map<String, dynamic> data) {
    if (data == null) return null;

    return Notes(
      location: data['location'],
      //uid: id,
      description: data['description'],
      date: DateTime(data['date']),
    );
  }
}
