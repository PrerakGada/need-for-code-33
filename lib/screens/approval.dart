import 'package:flutter/material.dart';

class Approval extends StatelessWidget {
  const Approval({Key? key}) : super(key: key);
  static const String id = 'Approve';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(
          'Username : Prerak',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.approval),
                label: Text('Yes')),
            RaisedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.close),
              label: Text('No'),
            )
          ],
        )
      ]),
    );
  }
}
