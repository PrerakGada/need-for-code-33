import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = 'DashboardScreen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Hello'),
    );
  }
}
