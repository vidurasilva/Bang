import 'dart:async';
import 'package:flutter/material.dart';
import 'package:thousand_bits/src/home/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center
  @override
  Widget build(BuildContext context) {
    // return SplashScreen.navigate(
    //   name: 'intro.flr',
    //   next: (_) => HomeView(),
    //   until: () => Future.delayed(Duration(seconds: 5)),
    //   startAnimation: '1',
    // );
    return Scaffold(
      backgroundColor: Colors.green[350],
      body: Center(
        child: Text(
          "It open your 1000 hopes, Join with Us and bit",
          style: TextStyle(
            fontSize: 50.0,
            color: Colors.white,
            fontFamily: "Satisfy",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
