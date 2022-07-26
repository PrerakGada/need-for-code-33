import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/main_drawer.dart';
import 'dashboard_screen.dart';

class NotificationsScreen extends StatelessWidget {
  static const String id = 'NotificationScreen';

  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = ['PENDING ASSIGNMENTS', 'PASSWORD CHANGED'];
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                title: Text(list[1]),
                subtitle: Text('password is changed'),
                trailing: Text('27-06-2004 12:03pm',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                title: Text(list[1]),
                subtitle: Text('password is changed'),
                trailing: Text('27-06-2004 12:03pm',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),
              ),
            ),                Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                title: Text(list[1]),
                subtitle: Text('password is changed'),
                trailing: Text('27-06-2004 12:03pm',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),
              ),
            ),                Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                title: Text(list[1]),
                subtitle: Text('password is changed'),
                trailing: Text('27-06-2004 12:03pm',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
