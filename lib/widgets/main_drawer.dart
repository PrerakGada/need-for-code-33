import 'package:flutter/material.dart';
import 'package:studybuddy/screens/about_us.dart';
import 'package:studybuddy/screens/faqs.dart';
import 'package:studybuddy/screens/login_screen.dart';
import 'package:studybuddy/theme.dart';

import '../screens/profile_screen.dart';
import '../screens/report_bugs.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

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
            icon: Icons.assignment,
            onPressed: () {},
            title: 'Assignments',
          ),
          // DrawerOption(
          //   icon: Icons.notifications,
          //   onPressed: () {},
          //   title: 'Attendance',
          // ),
          DrawerOption(
            icon: Icons.branding_watermark_outlined,
            onPressed: () {},
            title: 'Marksheet',
          ),
          // DrawerOption(
          //   icon: Icons.feed,
          //   onPressed: () {},
          //   title: 'Tests',
          // ),
          // DrawerOption(
          //   icon: Icons.contact_mail_outlined,
          //   onPressed: () {},
          //   title: 'Lectures',
          // ),
          DrawerOption(
            icon: Icons.report,
            onPressed: () {
              Navigator.pushNamed(context, ReportBugs.id);
            },
            title: 'Report Bugs',
          ),
          DrawerOption(
            icon: Icons.pending,
            onPressed: () {
              Navigator.pushNamed(context, About_Us.id);
            },
            title: 'About Us',
          ),
          DrawerOption(
            icon: Icons.question_mark,
            onPressed: () {
              Navigator.pushNamed(context,FAQs.id);
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
