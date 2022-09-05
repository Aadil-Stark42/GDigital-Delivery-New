import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdigitaldelivery/res/ResColor.dart';
import 'package:gdigitaldelivery/screens/SplashScreen.dart';
import 'package:gdigitaldelivery/screens/home/HomeScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //Lets make the Status Bar Transparent
    statusBarColor: whiteColor,

    //Lets make the status bar icon brightness to bright
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDigital Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
