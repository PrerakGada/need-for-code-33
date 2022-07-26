import 'package:flutter/material.dart';
import 'package:studybuddy/widgets/bottom_bar.dart';
import 'package:studybuddy/widgets/main_drawer.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = 'DashboardScreen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(),
      bottomNavigationBar: BottomBar(selectedIndex: 0),
      body: Text('Dashboard'),
    );
  }
}
