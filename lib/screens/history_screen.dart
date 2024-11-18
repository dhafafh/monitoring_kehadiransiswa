import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/attendance_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Kehadiran'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: attendanceProvider.attendanceHistory.length,
        itemBuilder: (ctx, index) {
          final history = attendanceProvider.attendanceHistory[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                DateFormat('dd MMM yyyy').format(history['date']),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Hadir: ${history['present']}, Tidak Hadir: ${history['absent']}',
              ),
            ),
          );
        },
      ),
    );
  }
}
