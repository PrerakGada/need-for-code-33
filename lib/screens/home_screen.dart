import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:studybuddy/models/utilModel.dart';
import 'package:studybuddy/screens/calendar_screen.dart';
import 'package:studybuddy/screens/dashboard_screen.dart';
import 'package:studybuddy/screens/messages_screen.dart';
import 'package:studybuddy/screens/notifications_screen.dart';
import 'package:studybuddy/theme.dart';
import 'package:studybuddy/widgets/main_drawer.dart';

import '../models/schoolModel.dart';


class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
String? n;
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  var pageController = PageController();
  List pages = ['Dashboard', 'Calender', 'Notifications', 'Chat'];

  getUser() async {
    var school = School('0001');
    var useEmail = await getCurrentUserEmail();
    var user = school.createUser(useEmail!);
    var userInfo = await user.getUserInfo();
    var name = userInfo['userName'];
    print(await name.runtimeType);
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(pages[currentIndex]),
      ),
      drawer: TeacherDrawer(name: 'Prerak Gada'),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (int page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: [
          DashboardScreen(),
          CalenderScreen(),
          NotificationsScreen(),
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
