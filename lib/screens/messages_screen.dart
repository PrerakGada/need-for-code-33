import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/main_drawer.dart';

class MessagesScreen extends StatelessWidget {
  static const String id = 'MessagesScreen';

  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(),
      bottomNavigationBar: BottomBar(selectedIndex: 3),
      body: Text('Messages'),
    );
  }
}
