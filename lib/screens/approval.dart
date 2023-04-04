import 'package:flutter/material.dart';
import 'package:studybuddy/screens/home_screen.dart';

class Approval extends StatelessWidget {
  const Approval({Key? key}) : super(key: key);
  static const String id = 'Approve';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Column(children: [
          const Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          const Text(
            'Username : Prerak',
            style: TextStyle(
              fontSize: 18
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 50,
                right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, HomeScreen.id);
                  },
                  icon: Icon(Icons.approval),
                  label: Text('Yes')),
                ElevatedButton.icon(
                  onPressed: () {
                      Navigator.pushNamed(context, HomeScreen.id);
                  },
                  icon: Icon(Icons.close),
                  label: Text('No'),
                )
            ],
          )
        ),
      ]),
            ),
    );
  }
}
