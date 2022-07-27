import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class About_Us extends StatefulWidget {
  static const String id = 'About_Us';

  const About_Us({Key? key}) : super(key: key);

  @override
  State<About_Us> createState() => _About_UsState();
}

class _About_UsState extends State<About_Us> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30), //border corner radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), //color of shadow
                        spreadRadius: 5, //spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Computer Science',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 150,
                              child: Text(' - Kulkarni Janardan \n - Radhika Shah \n - Priti Bokaria \n - Sharayu Kadam \n - Siddesh Masur',
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  color: AppColors.ternary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: AppColors.secondary,
                              radius: 50,
                              child: Text(
                                "CSE", style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              ),
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30), //border corner radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), //color of shadow
                        spreadRadius: 5, //spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child: Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Information Technology',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 CircleAvatar(
                   backgroundColor: AppColors.secondary,
                   radius: 50,
                   child: Text(
                     "IT", style: TextStyle(
                       color: AppColors.black,
                       fontWeight: FontWeight.bold,
                       fontSize: 30
                   ),
                   ),
                 ),
                 Container(
                   width: 150,
                   child: Text(' - Krishna Kansara \n - Manish Solanki \n - Abhilasha More \n - Pankaj Rathod \n - Neha More',
                     overflow: TextOverflow.clip,
                     style: TextStyle(
                       color: AppColors.ternary,
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
               ],
             ),


            // subtitle: Text('password is changed',
            //   style: TextStyle(
            //     color: Colors.grey,
            //   ),
            // ),
                  ]
        ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30), //border corner radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), //color of shadow
                        spreadRadius: 5, //spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Mechenical Engineering',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 150,
                              child: Text(' - Kulkarni Janardan \n - Radhika Shah \n - Priti Bokaria \n - Sharayu Kadam \n - Siddesh Masur',
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  color: AppColors.ternary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: AppColors.secondary,
                              radius: 50,
                              child: Text(
                                "ME", style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                              ),
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30), //border corner radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), //color of shadow
                        spreadRadius: 5, //spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Electrical Engineering',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.secondary,
                              radius: 50,
                              child: Text(
                                "EE", style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30
                              ),
                              ),
                            ),
                            Container(
                              width: 150,
                              child: Text(' - Krishna Kansara \n - Manish Solanki \n - Abhilasha More \n - Pankaj Rathod \n - Neha More',
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  color: AppColors.ternary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),


                        // subtitle: Text('password is changed',
                        //   style: TextStyle(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                      ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
