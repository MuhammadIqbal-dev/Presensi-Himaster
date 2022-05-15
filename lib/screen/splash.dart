import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controller/mainController.dart';
import 'dart:async';

import 'package:presensi_himaster/screen/onboarding.dart';
import 'package:presensi_himaster/theme.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final mainController = Get.put(MainController());

  @override
  void initState() {
    startSplash();
    super.initState();
  }

  startSplash() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, myNavigation);
  }

  void myNavigation() {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) =>
                const OnBoarding()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5, 0.9],
                colors: [startCr, midCr, darkBlueCr])),
        child: const Center(child: Image(image: AssetImage('assets/imgs/logo.png'))),
      ),
    );
  }
}
