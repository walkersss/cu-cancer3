import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';

class AppEvent {
  final String name;
  final String type;
  final String department;
  final String userID;
  final String id;
  final String time;
  final String date;
  AppEvent({
    this.name,
    this.type,
    this.department,
    this.userID,
    this.id,
    this.time,
    this.date,
  });

  AppEvent copyWith({
    String name,
    String type,
    String department,
    String userID,
    String id,
    String time,
    String date,
  }) {
    return AppEvent(
      name: name ?? this.name,
      type: type ?? this.type,
      department: department ?? this.department,
      userID: userID ?? this.userID,
      id: id ?? this.id,
      time: time ?? this.time,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'department': department,
      'userID': userID,
      'id': id,
      'time': time,
      'date': date,
    };
  }

  factory AppEvent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AppEvent(
      name: map['name'],
      type: map['type'],
      department: map['department'],
      userID: map['userID'],
      id: map['id'],
      time: map['time'],
      date: map['date'],
    );
  }

  factory AppEvent.fromDS(String id, Map<String, dynamic> map) {
    if (map == null) return null;

    return AppEvent(
      name: map['name'],
      type: map['type'],
      department: map['department'],
      userID: map['userID'],
      id: id,
      time: map['time'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppEvent.fromJson(String source) =>
      AppEvent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppEvent(name: $name, type: $type, department: $department, userID: $userID, id: $id, time: $time, date: $date)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppEvent &&
        o.name == name &&
        o.type == type &&
        o.department == department &&
        o.userID == userID &&
        o.id == id &&
        o.time == time &&
        o.date == date;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        type.hashCode ^
        department.hashCode ^
        userID.hashCode ^
        id.hashCode ^
        time.hashCode ^
        date.hashCode;
  }
}
