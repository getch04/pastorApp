import 'package:churchapp_flutter/screens/HomePage.dart';
import 'package:churchapp_flutter/screens/OnboardingPage.dart';
import 'package:churchapp_flutter/screens/homeScreen.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/SplashScreen";

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seenOnboarding = prefs.getBool("user_seen_onboarding_page");

    if (seenOnboarding == null || !seenOnboarding) {
      Navigator.pushReplacementNamed(context, OnboardingPage.routeName);
    } else {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(color: Colors.grey[100]),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.5,
                0.9,
              ],
              colors: [
                Color.fromARGB(255, 255, 244, 148),
                Color.fromARGB(255, 181, 255, 185)
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Animate(
                    effects: [
                      MoveEffect(
                        begin: Offset(0, -200),
                        end: Offset(0, 0),
                        duration: Duration(seconds: 2),
                        curve: Curves.easeOut,
                      ),
                    ],
                    child: Image.asset(
                      'assets/images/icon.png',
                      width: 320,
                    ),
                  ),
                  Animate(
                    effects: [
                      MoveEffect(
                        begin: Offset(0, 200),
                        end: Offset(0, 0),
                        duration: Duration(seconds: 2),
                        curve: Curves.easeOut,
                      ),
                    ],
                    child: Text('My Virtual Pastor',
                        style: TextStyles.display3(context)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
