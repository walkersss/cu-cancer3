import 'dart:convert';

class Appointment {
  final String name;
  final String type;
  final String department;
  final String time;
  final String date;

  //constructor
  Appointment({
    this.name,
    this.type,
    this.department,
    this.time,
    this.date,
  });

  Appointment copyWith({
    String name,
    String type,
    String department,
    String time,
    String date,
  }) {
    return Appointment(
      name: name ?? this.name,
      type: type ?? this.type,
      department: department ?? this.department,
      time: time ?? this.time,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'department': department,
      'time': time,
      'date': date,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Appointment(
      name: map['name'],
      type: map['type'],
      department: map['department'],
      time: map['time'],
      date: map['date'],
    );
  }

  factory Appointment.fromDS(String id, Map<String, dynamic> map) {
    if (map == null) return null;

    return Appointment(
      name: map['name'],
      type: map['type'],
      department: map['department'],
      time: map['time'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Appointment.fromJson(String source) =>
      Appointment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Appointment(name: $name, type: $type, department: $department, time: $time, date: $date)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Appointment &&
        o.name == name &&
        o.type == type &&
        o.department == department &&
        o.time == time &&
        o.date == date;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        type.hashCode ^
        department.hashCode ^
        time.hashCode ^
        date.hashCode;
  }
}
