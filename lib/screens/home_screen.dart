import 'package:flutter/material.dart';
import 'package:studybuddy/screens/calendar_screen.dart';
import 'package:studybuddy/screens/dashboard_screen.dart';
import 'package:studybuddy/screens/messages_screen.dart';
import 'package:studybuddy/screens/notifications_screen.dart';
import 'package:studybuddy/theme.dart';
import 'package:studybuddy/widgets/bottom_bar.dart';
import 'package:studybuddy/widgets/main_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
      ),
      drawer: MainDrawer(),
      body: PageView(
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
      bottomNavigationBar: BottomBar(
        selectedIndex: currentIndex,
        pageController: pageController,
      ),
    );
  }
}
