import 'package:flutter/material.dart';
import 'package:studybuddy/screens/calendar_screen.dart';
import 'package:studybuddy/screens/dashboard_screen.dart';
import 'package:studybuddy/screens/messages_screen.dart';

import '../screens/notifications_screen.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;

  const BottomBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  void onItemTapped(index, context) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, DashboardScreen.id);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, CalenderScreen.id);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, NotoficationScreen.id);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, MessagesScreen.id);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(size: 30),
      currentIndex: selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        onItemTapped(index, context);
      },
      items: const [
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
    );
  }
}
