import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:studybuddy/screens/dashboard_screen.dart';
import 'package:studybuddy/screens/profile_screen.dart';

import '../theme.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = 'OnboardingScreen';

  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  double currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: const [
                OnboardingItem(
                  imageUrl: 'assets/images/ob1.png',
                  title: 'Study Buddy',
                  description:
                      'Tracking your studies can help to monitor and support the continuous process of learning. ',
                ),
                OnboardingItem(
                  imageUrl: 'assets/images/ob2.png',
                  title: 'Study Buddy',
                  description:
                      'Full implementation of competency based examination, including all processes and monitoring systems',
                ),
                OnboardingItem(
                  imageUrl: 'assets/images/ob3.png',
                  title: 'Study Buddy',
                  description:
                      'A very powerful tool for quality assurance of education.',
                ),
              ],
            ),
            Positioned(
              // alignment: Alignment.center,
              top: MediaQuery.of(context).size.height * 0.6,
              left: MediaQuery.of(context).size.width * 0.5 - 32,
              child: SmoothPageIndicator(
                count: 3,
                controller: _pageController,
                effect: WormEffect(
                  dotWidth: 16,
                  dotHeight: 4,
                  activeDotColor: AppColors.primary,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 16, left: 16, bottom: 22),
                    child: MaterialButton(
                      height: 42,
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                      color: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const OnboardingItem({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image(
          image: AssetImage(imageUrl),
          // height: 300,
          width: MediaQuery.of(context).size.width,
        ),
        Padding(
          padding: const EdgeInsets.all(56),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24, bottom: 6),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineLarge?.merge(
                        TextStyle(
                          fontSize: 18,
                        ),
                      ),
                ),
              ),
              Container(
                width: 276,
                padding: EdgeInsets.only(top: 6, bottom: 56),
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
