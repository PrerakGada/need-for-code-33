import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:studybuddy/theme.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class MarkSheetScreen extends StatelessWidget {
  static const String id = 'MarkSheetScreen';

  const MarkSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenshotController screenshotController = ScreenshotController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Screenshot(
            controller: screenshotController,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Student Report Card'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                        border: TableBorder.all(color: AppColors.black),
                        children: [
                          TableRow(
                            children: [
                              TableCell(child: Container(child: Text('Name'))),
                              TableCell(
                                  child:
                                      Container(child: Text('Academic Year'))),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(child: Container(child: Text('Grade'))),
                              TableCell(child: Container(child: Text('Term'))),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                  child: Container(child: Text('Teacher'))),
                              TableCell(child: Container(child: Text('Date'))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                        border: TableBorder.all(color: AppColors.black),
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                  child: Container(child: Text('Subject'))),
                              TableCell(child: Container(child: Text('Marks'))),
                              TableCell(child: Container(child: Text('Grade'))),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(child: Container(child: Text('Maths'))),
                              TableCell(
                                  child: Container(child: Text('99/100'))),
                              TableCell(child: Container(child: Text('A'))),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(child: Container(child: Text('Maths'))),
                              TableCell(
                                  child: Container(child: Text('99/100'))),
                              TableCell(child: Container(child: Text('A'))),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(child: Container(child: Text('Maths'))),
                              TableCell(
                                  child: Container(child: Text('99/100'))),
                              TableCell(child: Container(child: Text('A'))),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(child: Container(child: Text('Maths'))),
                              TableCell(
                                  child: Container(child: Text('99/100'))),
                              TableCell(child: Container(child: Text('A'))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            child: Text(
              'Capture Above Widget',
            ),
            onPressed: () {
              screenshotController
                  .capture(delay: Duration(milliseconds: 10))
                  .then((capturedImage) async {
                ShowCapturedWidget(context, capturedImage!);
              }).catchError((onError) {
                print(onError);
              });
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured widget screenshot"),
        ),
        body: Center(
            child: capturedImage != null
                ? Image.memory(capturedImage)
                : Container()),
      ),
    );
  }

  _saved(image) async {
    final result = await ImageGallerySaver.saveImage(image.readAsBytesSync());
    print("File Saved to Gallery");
  }
}
