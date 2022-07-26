import 'package:flutter/material.dart';
import 'package:studybuddy/screens/attendance_screen.dart';
import 'package:studybuddy/screens/faqs.dart';
import 'package:studybuddy/screens/login_screen.dart';
import 'package:studybuddy/screens/marksheet_screen.dart';
import 'package:studybuddy/theme.dart';

import '../screens/about_us.dart';
import '../screens/approval.dart';
import '../screens/profile_screen.dart';
import '../screens/report_bugs.dart';

class TeacherDrawer extends StatelessWidget {
  final String name;

  const TeacherDrawer({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: AppColors.secondary,
            padding: const EdgeInsets.only(left: 16.0, top:70),
            child: Column(

              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 10))
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Alia Bhatt',
                      style: TextStyle(color: AppColors.black, fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ProfileScreen.id);
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const DrawerOptionsList(),
        ],
      ),
    );
  }
}

class DrawerOptionsList extends StatelessWidget {
  const DrawerOptionsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        left: 10,
      ),
      child: Column(
        children: [
          DrawerOption(
            icon: Icons.language,
            onPressed: () {},
            title: 'Assignments',
          ),
          DrawerOption(
            icon: Icons.contact_mail_outlined,
            onPressed: () {
              Navigator.pushNamed(context, Approval.id);
            },
            title: 'Approvals',
          ),
          DrawerOption(
            icon: Icons.notifications,
            onPressed: () {
              Navigator.pushNamed(context, AttendanceScreen.id);
            },
            title: 'Attendance',
          ),
          DrawerOption(
            icon: Icons.share,
            onPressed: () {
              Navigator.of(context).pushNamed(MarkSheetScreen.id);
            },
            title: 'Mark Sheet',
          ),
          DrawerOption(
            icon: Icons.feed,
            onPressed: () {},
            title: 'Tests',
          ),
          DrawerOption(
            icon: Icons.contact_mail_outlined,
            onPressed: () {},
            title: 'Lectures',
          ),
          DrawerOption(
            icon: Icons.chat,
            onPressed: () {
              Navigator.pushNamed(context, ReportBugs.id);
            },
            title: 'Report Bugs',
          ),
          DrawerOption(
            icon: Icons.pending_outlined,
            onPressed: () {
              Navigator.pushNamed(context, About_Us.id);
            },
            title: 'About',
          ),
          DrawerOption(
            icon: Icons.policy,
            onPressed: () {
              Navigator.pushNamed(context, FAQs.id);
            },
            title: 'FAQs',
          ),
          DrawerOption(
            icon: Icons.logout,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Do you really want to logout?'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.popAndPushNamed(
                                    context, LoginScreen.id);
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
            title: 'Logout',
          ),
        ],
      ),
    );
  }
}

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const DrawerOption({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // width: 40,
      // backgroundColor: Colors.blue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: AppColors.secondary,
            padding: const EdgeInsets.only(left: 16.0, top: 150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Prinkal Doshi',
                  style: TextStyle(color: AppColors.black, fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ProfileScreen.id);
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          const StudentDrawerOptionsList(),
        ],
      ),
    );
  }
}

class StudentDrawerOptionsList extends StatelessWidget {
  const StudentDrawerOptionsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        left: 10,
      ),
      child: Column(
        children: [
          DrawerOption(
            icon: Icons.language,
            onPressed: () {},
            title: 'Assignments',
          ),
          DrawerOption(
            icon: Icons.notifications,
            onPressed: () {},
            title: 'Attendance',
          ),
          DrawerOption(
            icon: Icons.share,
            onPressed: () {
              Navigator.of(context).pushNamed(MarkSheetScreen.id);
            },
            title: 'Mark Sheet',
          ),
          DrawerOption(
            icon: Icons.feed,
            onPressed: () {},
            title: 'Tests',
          ),
          DrawerOption(
            icon: Icons.chat,
            onPressed: () {
              Navigator.pushNamed(context, ReportBugs.id);
            },
            title: 'Report Bugs',
          ),
          DrawerOption(
            icon: Icons.pending_outlined,
            onPressed: () {
              Navigator.pushNamed(context, About_Us.id);
            },
            title: 'About',
          ),
          DrawerOption(
            icon: Icons.policy,
            onPressed: () {
              Navigator.pushNamed(context, FAQs.id);
            },
            title: 'FAQs',
          ),
          DrawerOption(
            icon: Icons.logout,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Do you really want to logout?'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.popAndPushNamed(
                                    context, LoginScreen.id);
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
            title: 'Logout',
          ),
        ],
      ),
    );
  }
}

class StudentDrawerOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const StudentDrawerOption({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
