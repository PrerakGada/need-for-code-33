import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studybuddy/models/schoolModel.dart';
import 'package:studybuddy/screens/dashboard_screen.dart';
import 'package:studybuddy/screens/home_screen.dart';
import 'package:studybuddy/theme.dart';

import '../models/utilModel.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String code = '0000';
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
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/ob1.png'),
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(
                    right: 16, left: 16, top: 24, bottom: 100),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text(
                        'Enter Your School Code',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        code = value;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: '1234',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: MaterialButton(
                  height: 42,
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  color: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () async {
                    var isValid = await isValidSchool(code);
                    if (isValid) {
                      print(code);
                      // Navigator.of(context).popAndPushNamed(LoginOptions.id);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return LoginOptions(id: code);
                          },
                        ),
                      );
                    } else {
                      print('Else');
                    }
                  },
                  child: Text(
                    'Verify',
                    style: Theme.of(context).textTheme.headlineLarge?.merge(
                          TextStyle(color: AppColors.white),
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginOptions extends StatelessWidget {
  final String id;

  const LoginOptions({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Wrap(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            alignment: WrapAlignment.spaceEvenly,
            verticalDirection: VerticalDirection.up,
            runSpacing: 20,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return LoginUser(
                          role: 'teacher',
                          id: id,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, spreadRadius: 3),
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(33.0),
                          child: Image(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/images/ob3.png'),
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                        ),
                        Text(
                          'I am a Teacher',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ]),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, LoginUser.id);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return LoginUser(
                          role: 'student',
                          id: id,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, spreadRadius: 3),
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(33.0),
                          child: Image(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/images/ob2.png'),
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                        ),
                        Text(
                          'I am a Student',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ]),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return LoginUser(
                          role: 'admin',
                          id: id,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, spreadRadius: 3),
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(33.0),
                          child: Image(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/images/ob1.png'),
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                        ),
                        Text(
                          'I am Admin',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginUser extends StatelessWidget {
  final String role;

  // static const String id = 'LoginUser';
  final String id;

  const LoginUser({Key? key, required this.role, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String email = '1@1.com';
    late String password = '000000';
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
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/ob1.png'),
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(
                    right: 16, left: 16, top: 24, bottom: 100),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text(
                        'Enter Your Email',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      // inputFormatters: [FilteringTextInputFormatter.allow()],
                      decoration: InputDecoration(
                        hintText: 'hello@gmail.com',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text(
                        'Enter Your Password',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '333324',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: MaterialButton(
                  height: 42,
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  color: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () async {
                    var school = School(id);
                    var isValid = await school.loginUser(email, password, role);
                    if (isValid) {
                      AlertDialog(
                        title: const Text('Under Review '),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Your Registration is under Review'),
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
                      Navigator.of(context).popAndPushNamed(HomeScreen.id);
                    } else {
                      print('Invalid creds');
                    }
                  },
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineLarge?.merge(
                          TextStyle(color: AppColors.white),
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
