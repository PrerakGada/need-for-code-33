import 'package:flutter/material.dart';
import 'package:studybuddy/screens/AttendanceDashboard.dart';
import 'package:studybuddy/screens/Marks.dart';
import 'package:studybuddy/widgets/bottom_bar.dart';
import 'package:studybuddy/widgets/main_drawer.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = 'DashboardScreen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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

class StudentDashboardScreen extends StatelessWidget {
  static const String id = 'StudentDashboardScreen';

  const StudentDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MarksChart(),
              MarksChart(),
            ],
          ),
        ),
      ],
    );
  }
}
