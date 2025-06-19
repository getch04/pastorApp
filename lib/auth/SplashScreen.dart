import 'dart:convert';
import 'package:churchapp_flutter/models/models/splash.dart';
import 'package:dio/dio.dart';
import 'package:churchapp_flutter/screens/OnboardingPage.dart';
import 'package:churchapp_flutter/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/ApiUrl.dart';

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? seenOnboarding = prefs.getBool("user_seen_onboarding_page");

    await Future.delayed(Duration(seconds: 3));
    if (seenOnboarding == null) {
      List<Splash> splashes = await _fetchSplashData();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingPage(splashes: splashes),
        ),
      );
    } else {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  Future<List<Splash>> _fetchSplashData() async {
    try {
      Dio dio = Dio();
      var response = await dio.get(ApiUrl.BASEURL + 'api/splashes');
      var data = jsonDecode(response.data);
      List<Splash> splashes = (data['splashes'] as List)
          .map((item) => Splash.fromJson(item))
          .toList();
      return splashes;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/new/bg.png'),
            fit: BoxFit.cover,
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
                  child: Container(
                    child: Image.asset(
                      'assets/images/new/Dove.png',
                      width: 250,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/new/Bible_splash.png',
                      width: 320,
                    ),
                    Image.asset(
                      'assets/images/new/Text.png',
                      width: 320,
                    ),
                    Image.asset(
                      'assets/images/new/Logo.png',
                      width: 220,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
