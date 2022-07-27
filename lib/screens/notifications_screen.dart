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
    var list = ['PENDING ASSIGNMENT', 'EXTRA LECTURE','PASSWORD CHANGED','DEADLINE EXTENDED'];
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
                title: Text(list[2]),
                subtitle: Text('password is changed'),
                trailing: Text('27-06-2022 12:03pm',
                  style: TextStyle(
                    color: Colors.grey,
                  ),),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                title: Text(list[1]),
                subtitle: Text('Python Extra lecture has been scheduled at 2:30 pm on 30July 2022'),
                trailing: Text('29-06-2022 01:43pm',
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
                trailing: Text('27-07-2004 12:03pm',
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

class StudentNotificationsScreen extends StatelessWidget {
  static const String id = 'StudentNotificationsScreen';

  const StudentNotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = ['PENDING ASSIGNMENT', 'EXTRA LECTURE','PASSWORD CHANGED','DEADLINE EXTENDED'];
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
                  child:  IconButton(
                    icon: Icon(
                      Icons.app_registration,
                      color: AppColors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                title: Text(list[2],
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold
                  ),),
                subtitle: Text('password is changed'),
                trailing: Text('27-07-2004 12:03pm',
                  style: TextStyle(
                    color: AppColors.ternary,
                  ),),
              ),
            ),
            Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  child:  IconButton(
                    icon: Icon(
                      Icons.label_important,
                      color: AppColors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                title: Text(list[1],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                ),
                subtitle: Text('Python Extra lecture has been scheduled'),
              trailing: Text('29-06-2022 01:43pm',
                  style: TextStyle(
                    color: AppColors.ternary,
                  ),),
              ),
            ),                Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: Icon(
                      Icons.pending_outlined,
                      color: AppColors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                title: Text(list[0],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),),
                subtitle: Text('DBMS, CG - 2 assignments pending'),
                trailing: Text('12-06-2004 2:00am',
                  style: TextStyle(
                    color: AppColors.ternary,
                  ),),
              ),
            ),

            Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  child:  IconButton(
                    icon: Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                title: Text(list[3],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ), ),
                subtitle: Text('Python Experiment 3 - Deadline scheduled on 3May'),
                trailing: Text('01-05-2020 10:00am',
                  style: TextStyle(
                    color: AppColors.ternary,
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}