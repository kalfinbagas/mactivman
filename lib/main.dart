import 'package:flutter/material.dart';
import 'package:macman/view/auth/loginpage.dart';
import 'package:macman/view/home/home.dart';
import 'package:macman/view/home/scheduleprayer.dart';
import 'view/auth/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Splash Screen',
    initialRoute: '/splash',
    routes: {
      '/': (context) => HomePage(),
      '/splash': (context) => SplashScreen(),
      '/loginpage': (context) => LoginPage(),
      '/schedule': (context) => SchedulePrayer(),
    },
    // home: SplashScreen(),
  ));
}
