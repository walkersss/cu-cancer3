import 'dart:convert';

class AppEvent {
  final String name;
  final String type;
  final String department;
  final DateTime time;
  final DateTime date;
  AppEvent({
    this.name,
    this.type,
    this.department,
    this.time,
    this.date,
  });

  AppEvent copyWith({
    String name,
    String type,
    String department,
    DateTime time,
    DateTime date,
  }) {
    return AppEvent(
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
      'time': time?.millisecondsSinceEpoch,
      'date': date?.millisecondsSinceEpoch,
    };
  }

  factory AppEvent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AppEvent(
      name: map['name'],
      type: map['type'],
      department: map['department'],
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppEvent.fromJson(String source) =>
      AppEvent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppEvent(name: $name, type: $type, department: $department, time: $time, date: $date)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppEvent &&
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
