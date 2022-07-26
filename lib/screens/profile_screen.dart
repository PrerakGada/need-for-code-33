import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Hello'),
    );
  }
}
