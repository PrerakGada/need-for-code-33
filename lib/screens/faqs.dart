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
                title: Text('How much time would it take to activate the student registration'),
                children: <Widget>[
                  ListTile(title: Text('within a short while',
                    style: TextStyle(
                        color: AppColors.secondary
                    ),)),
                ],
              ),
            ),
            Card(
              elevation: 5,
              child: ExpansionTile(
                title: Text('How reset the Student Registration password'),
                children: <Widget>[
                  ListTile(title: Text('It cannot manually be changed by the student. You have to contact the administration.',
                    style: TextStyle(
                        color: AppColors.secondary
                    ),)),
                ],
              ),
            ),
            Card(
              elevation: 5,
              child: ExpansionTile(
                title: Text('How to delete Student Registration Account'),
                children: <Widget>[
                  ListTile(title: Text('Contact Administration',
                    style: TextStyle(
                        color: AppColors.secondary
                    ),)),
                ],
              ),
            ),
            Card(
              elevation: 5,
              child: ExpansionTile(
                title: Text('How to edit Student Profile'),
                children: <Widget>[
                  ListTile(title: Text('Login to your account.Go to Dashboard. Click on the left button. click on the > sign and then you can edit your profile',
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
