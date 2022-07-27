import 'package:flutter/material.dart';
import 'package:studybuddy/screens/calendar_screen.dart';
import 'package:studybuddy/screens/dashboard_screen.dart';
import 'package:studybuddy/screens/messages_screen.dart';
import 'package:studybuddy/screens/notifications_screen.dart';
import 'package:studybuddy/theme.dart';
import 'package:studybuddy/widgets/main_drawer.dart';

class StudentHomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  StudentHomeScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  int currentIndex = 0;
  var pageController = PageController();
  List pages = ['Dashboard', 'Calender', 'Notifications', 'Chat'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(pages[currentIndex]),
      ),
      drawer: StudentDrawer(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (int page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: [
          StudentDashboardScreen(),
          CalenderScreen(),
          StudentNotificationsScreen(),
          MessagesScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primary,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(size: 30),
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            // backgroundColor: Colors.black,
            label: 'Home',
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Discover',
            icon: Icon(
              Icons.calendar_month_outlined,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Notifications',
            activeIcon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Upload',
            activeIcon: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.mail_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
