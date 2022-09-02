import 'package:flutter/material.dart';
import 'package:gdigitaldelivery/res/ResColor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/ResString.dart';
import 'home/HomeScreen.dart';
import 'intro/IntroScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  Future checkFirstSeen() async {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      redirectScreen(prefs);
    });
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Image.asset(
        '${imagePath}img_splash.png',
        width: double.maxFinite,
        height: double.maxFinite,
        fit: BoxFit.cover,
      ),
    );
  }

  void redirectScreen(SharedPreferences prefs) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => IntroScreen()),
        (Route<dynamic> route) => false);
  }
}
