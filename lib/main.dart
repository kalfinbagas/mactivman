import 'package:flutter/material.dart';
import 'package:macman/view/auth/loginpage.dart';
import 'package:macman/view/home/appmanagement.dart';
import 'package:macman/view/home/broadcast.dart';
import 'package:macman/view/home/home.dart';
import 'package:macman/view/home/monitoring.dart';
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
      '/broadcast': (context) => BroadcastPage(),
      '/monitoring': (context) => MonitoringPage(),
      '/appmanagement': (context) => AppManagementPage(),
    },
    // home: SplashScreen(),
  ));
}
