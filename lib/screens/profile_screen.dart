import 'package:flutter/material.dart';
import 'package:studybuddy/widgets/main_drawer.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(),
      body: Text('Profile'),
    );
  }
}
