import 'package:flutter/material.dart';
import 'package:studybuddy/screens/AttendanceDashboard.dart';
import 'package:studybuddy/screens/Marks.dart';
import 'package:studybuddy/screens/SubjectScreen.dart';
import 'package:studybuddy/theme.dart';
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
    final subs = ['Maths', 'English', 'Python', 'Flutter'];
    return SingleChildScrollView(
      child: Column(
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
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Wrap(
              direction: Axis.horizontal,
              children: [
                for (int x = 0; x < 4; x++)
                MaterialButton(
                  onPressed: () {
                    print('Pressed');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return SubjectScreen(title: subs[x]);
                        },
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text(
                        subs[x],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
