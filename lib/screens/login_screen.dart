import 'package:flutter/material.dart';
import 'package:studybuddy/screens/dashboard_screen.dart';
import 'package:studybuddy/theme.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginSchool();
  }
}

class LoginSchool extends StatelessWidget {
  const LoginSchool({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {},
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
                          'Create a Scool',
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
                        return LoginUser();
                      },
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width * 0.4,
                  //  margin: const EdgeInsets.all(15.0),
                  //  padding: const EdgeInsets.all(3.0),
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
                          'Join a School',
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
  const LoginUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {},
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
                  Navigator.pushReplacementNamed(context, DashboardScreen.id);
                },
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width * 0.4,
                  //  margin: const EdgeInsets.all(15.0),
                  //  padding: const EdgeInsets.all(3.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
