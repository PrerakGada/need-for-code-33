import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/main_drawer.dart';

class NotoficationScreen extends StatelessWidget {
  static const String id = 'NotoficationScreen';

  const NotoficationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(),
      bottomNavigationBar: BottomBar(selectedIndex: 2),
      body: Text('Notification'),
    );
  }
}
