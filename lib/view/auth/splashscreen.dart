import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacementNamed(
        context,
        '/loginpage',
      );
    });
  }

  /************* BIG LOGO **********/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // stops: [0.5, 0, 5],
            colors: <Color>[Color(0xFF2CF4A3), Color.fromRGBO(11, 225, 135, 1)],
            // tileMode: TileMode.repeated,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'img/biglogo.png',
              width: 200.0,
              height: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
/************* END OF BIG LOGO **********/
