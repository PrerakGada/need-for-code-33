import 'package:flutter/material.dart';
import 'package:studybuddy/theme.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/main_drawer.dart';
import 'dashboard_screen.dart';

// class NotificationBox extends StatelessWidget {
//   NotificationBox({ Key? key, this.onTap, this.notifiedNumber = 0}) : super(key: key);
//   final GestureTapCallback? onTap;
//   final int notifiedNumber;

class NotificationScreen extends StatelessWidget {
  static const String id = 'NotificationScreen';

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = ['PENDING ASSIGNMENTS', 'PASSWORD CHANGED'];
    return MaterialApp(
      home: Scaffold(
           appBar: AppBar(
             backgroundColor: AppColors.primary,
             elevation: 1,
             leading: IconButton(
               icon: Icon(
                 Icons.arrow_back,
                 color: AppColors.white,
               ),
               onPressed: () {
                 Navigator.pushNamed(context, DashboardScreen.id);
               },
             ),
           ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                    title: Text(list[1]),
                    subtitle: Text('password is changed'),
                    trailing: Text('27-06-2004 12:03pm',
                    style: TextStyle(
                      color: Colors.grey,
                    ),),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                    title: Text(list[1]),
                    subtitle: Text('password is changed'),
                    trailing: Text('27-06-2004 12:03pm',
                      style: TextStyle(
                        color: Colors.grey,
                      ),),
                  ),
                ),                Card(
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                    title: Text(list[1]),
                    subtitle: Text('password is changed'),
                    trailing: Text('27-06-2004 12:03pm',
                      style: TextStyle(
                        color: Colors.grey,
                      ),),
                  ),
                ),                Card(
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                    title: Text(list[1]),
                    subtitle: Text('password is changed'),
                    trailing: Text('27-06-2004 12:03pm',
                      style: TextStyle(
                        color: Colors.grey,
                      ),),
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
//       home: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             elevation: 1,
//             leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: AppColors.primary,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//           body: ListView.builder(
//         // the number of items in the list
//         itemCount: list.length,
//
//         // display each item of the product list
//         itemBuilder: (context, index) {
//       return Container(
//         height: MediaQuery.of(context).size.height*0.07,
//         width: MediaQuery.of(context).size.width*0.2,
//         color: AppColors.secondary,
//         key: ValueKey(list[index]),
//         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//         child: Row(
//           children: [
//             CircleAvatar(
//               backgroundColor: AppColors.primary,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 1.0),
//               child: Column(
//                 children: [
//                   Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Text(list[index],
//                       style: TextStyle(
//                         color: AppColors.black,
//                       )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Text(list[index],
//                         style: TextStyle(
//                           color: AppColors.black,
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//             Text("12-04-2022 12:03pm")
//           ],
//         ),
//       );
//     }))
//     );
//   }
// }