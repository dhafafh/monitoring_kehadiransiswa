import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';
import '../widgets/styled_widgets.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Presensi Siswa'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: attendanceProvider.students.length,
              itemBuilder: (ctx, index) {
                final student = attendanceProvider.students[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Text(
                      student.name[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(student.name, style: StyledWidgets.listTileTitle),
                  trailing: Checkbox(
                    value: student.isPresent,
                    onChanged: (value) {
                      student.isPresent = value!;
                      attendanceProvider.notifyListeners();
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: attendanceProvider.students.isNotEmpty
                    ? attendanceProvider.saveAttendance
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 28,
                  ),
                ),
                child: const Text('Simpan Kehadiran'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
