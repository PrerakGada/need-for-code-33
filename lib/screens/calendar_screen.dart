import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:studybuddy/models/schoolModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class CalenderScreen extends StatelessWidget {
  static const String id = 'CalenderScreen';

  const CalenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String school_id = '0001';
  final School school = School(school_id);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("schools")
            .doc(school_id)
            .collection('events')
            .snapshots(),
        builder: (context, snapshot) {
          return SfCalendar(
            view: CalendarView.week,
            firstDayOfWeek: 6,
            dataSource: MeetingDataSource(snapshot.hasData
                ? getAppointments(snapshot.data!)
                : <Appointment>[]),
          );
        });
  }
}

Color generateRandomColor1() {
  // Define all colors you want here
  const predefinedColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];
  Random random = Random();
  return predefinedColors[random.nextInt(predefinedColors.length)];
}

List<Appointment> getAppointments(QuerySnapshot appointmentData) {
  List<Appointment> meetings = <Appointment>[];
  appointmentData.docs.forEach((doc) {
    meetings.add(Appointment(
        startTime: DateTime.fromMillisecondsSinceEpoch(doc['event_start_time']),
        endTime: DateTime.fromMillisecondsSinceEpoch(doc['event_end_time']),
        subject: doc['event_subject'],
        color: generateRandomColor1(),
        recurrenceRule: doc['event_recurrence_rule'],
        isAllDay: false));
  });
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
