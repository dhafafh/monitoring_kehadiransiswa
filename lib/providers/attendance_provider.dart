import 'package:flutter/material.dart';
import '../models/student.dart';

class AttendanceProvider with ChangeNotifier {
  List<Student> students = [
    Student(name: 'Dhafa Firjatullah Hikmal'),
    Student(name: 'Atta Cidul'),
    Student(name: 'Ishak Permana'),
  ];

  List<Map<String, dynamic>> attendanceHistory = [];

  void saveAttendance() {
    int presentCount = students.where((s) => s.isPresent).length;
    int absentCount = students.length - presentCount;

    attendanceHistory.insert(0, {
      'date': DateTime.now(),
      'present': presentCount,
      'absent': absentCount,
    });

    for (var student in students) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}
