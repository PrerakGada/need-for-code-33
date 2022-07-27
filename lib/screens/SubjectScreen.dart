import 'package:flutter/material.dart';

import '../theme.dart';

class SubjectScreen extends StatelessWidget {
  final String title;
  static const String id = 'SubjectScreen';

  const SubjectScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('acscsac'),
          ],
        ),
      ),
    );
  }
}
