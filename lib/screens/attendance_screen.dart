import 'package:flutter/material.dart';
import 'package:studybuddy/screens/Marks.dart';
import 'package:studybuddy/screens/AttendanceDashboard.dart';

class AttendanceScreen extends StatelessWidget {
  static const String id = 'AttendanceScreen';
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MarksChart(),
            AttendancePie(),
          ],
        ),
      ),
      MarksChart(),
    ],
    );
  }
}
