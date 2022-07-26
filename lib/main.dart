import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studybuddy/screens/dashboard_screen.dart';
import 'package:studybuddy/screens/home_screen.dart';
import 'package:studybuddy/screens/messages_screen.dart';
import 'package:studybuddy/screens/notifications_screen.dart';
import 'package:studybuddy/screens/report_bugs.dart';
import 'package:studybuddy/screens/splash_screen.dart';
import 'package:studybuddy/screens/onboarding_screen.dart';
import 'package:studybuddy/screens/faqs.dart';

import 'firebase_options.dart';
import 'screens/calendar_screen.dart';
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      // themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        DashboardScreen.id: (context) => DashboardScreen(),
        OnboardingScreen.id: (context) => OnboardingScreen(),
        MessagesScreen.id: (context) => MessagesScreen(),
        NotificationsScreen.id: (context) => NotificationsScreen(),
        CalenderScreen.id: (context) => CalenderScreen(),
        FAQs.id: (context) => FAQs(),
        ReportBugs.id: (context) => ReportBugs(),
      },
    );
  }
}


