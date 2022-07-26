import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';



class ReportBugs extends StatefulWidget {
  static const String id = 'ReportBugs';
  const ReportBugs({Key? key}) : super(key: key);

  @override
  State<ReportBugs> createState() => _ReportBugsState();
}

class _ReportBugsState extends State<ReportBugs> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            title: Text('Report Bugs'),
          ),
          body: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter your email address',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Bug Details',
                        hintText: 'Enter Bug Description',
                      ),
                    ),
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Submit'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Bug Reported'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Your bug has been submitted. Will get back to you soon.'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                            context);
                                      },
                                      child: const Text('Okay'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  )
                            ],
                          ),
          ) );
    }
  }
