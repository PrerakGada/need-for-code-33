import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/theme.dart';


class FAQs extends StatefulWidget {
  static const String id = 'FAQs';
  const FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {

  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FAQs'),
          backgroundColor: AppColors.primary,
      elevation: 1,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ExpansionTile(
                title: Text('ExpansionTile 1'),
                subtitle: Text('Trailing expansion arrow icon'),
                children: <Widget>[
                  ListTile(title: Text('This is tile number 1',
                    style: TextStyle(
                        color: AppColors.secondary
                    ),)),
                ],
              ),
            ),
            Card(
              elevation: 5,
              child: ExpansionTile(
                title: Text('ExpansionTile 1'),
                subtitle: Text('Trailing expansion arrow icon'),
                children: <Widget>[
                  ListTile(title: Text('This is tile number 1',
                    style: TextStyle(
                        color: AppColors.secondary
                    ),)),
                ],
              ),
            ),
            Card(
              elevation: 5,
              child: ExpansionTile(
                title: Text('ExpansionTile 1'),
                subtitle: Text('Trailing expansion arrow icon'),
                children: <Widget>[
                  ListTile(title: Text('This is tile number 1',
                    style: TextStyle(
                        color: AppColors.secondary
                    ),)),
                ],
              ),
            ),
            Card(
              elevation: 5,
              child: ExpansionTile(
                title: Text('ExpansionTile 1'),
                subtitle: Text('Trailing expansion arrow icon'),
                children: <Widget>[
                  ListTile(title: Text('This is tile number 1',
                    style: TextStyle(
                        color: AppColors.secondary
                    ),)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
