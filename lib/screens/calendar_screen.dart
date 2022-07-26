import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/main_drawer.dart';

class CalenderScreen extends StatelessWidget {
  static const String id = 'CalenderScreen';

  const CalenderScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(),
      bottomNavigationBar: BottomBar(selectedIndex: 1),
      body: Text('Calendar'),
    );
  }
}
