import 'package:churchapp_flutter/screens/OnboardingPage.dart';
import 'package:churchapp_flutter/screens/homeScreen.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                MyColors.bgTop,
                MyColors.bgBottom,
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 180,
                          child: Animate(
                            effects: [
                              MoveEffect(
                                begin: Offset(0, -200),
                                end: Offset(0, 0),
                                duration: Duration(seconds: 2),
                                curve: Curves.easeOut,
                              ),
                            ],
                            child: Container(
                              child: Image.asset(
                                'assets/images/new/bibl.png',
                                width: 200,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 250,
                          child: Image.asset(
                            'assets/images/new/cross.png',
                            width: 320,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'My Virtual Pastor',
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyles.display3(context)
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
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
