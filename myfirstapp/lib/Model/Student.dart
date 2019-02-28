// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

Student studentFromJson(String str) {
  final jsonData = json.decode(str);
  return Student.fromJson(jsonData);
}

String studentToJson(Student data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Student {
  int id;
  String fName;
  String lName;
  String major;
  String phone;

  Student({
    this.id,
    this.fName,
    this.lName,
    this.major,
    this.phone,
  });

  factory Student.fromJson(Map<String, dynamic> json) => new Student(
    id: json["id"],
    fName: json["first"],
    lName: json["last"],
    major: json["major"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first": fName,
    "last": lName,
    "major": major,
    "phone": phone,
  };
}
