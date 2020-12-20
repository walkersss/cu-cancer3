class Medicine {
  final String medicineName;
  final String medicineType;
  final int dosage;
  final DateTime time;
  final String interval;

  Medicine(
      {this.medicineName,
      this.medicineType,
      this.dosage,
      this.time,
      this.interval});

//  factory Medicine.fromJson(Map<dynamic, dynamic> json) => _MedicineFromJson(json);

  // Map<String, dynamic> toJson() => _MedicineToJson(this);
  @override
  String toString() => "Medicine<$medicineName>";
}
