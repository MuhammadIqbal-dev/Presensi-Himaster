import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presensi_himaster/widget/custom_alert_dialog.dart';

class MainController extends GetxController {
  CustomAlertDialog customAlertDialog = CustomAlertDialog();

  Rx<DateTime> now = DateTime.now().obs;
  final List itemsProfile = [
    'Semua Kegiatan',
    'Kegiatan Dihadiri',
    'Kegiatan Tidak Dihadiri'
  ].obs;
  RxInt enabledProfile = 0.obs;
  RxList droppedDown = [].obs;

  final Duration _duration = const Duration(seconds: 10);
  void updateDate() {
    Timer.periodic(_duration, (tes) {
      now.value = DateTime.now();
    });
  }

  // Widget getDialog(title, desc, func){
  //   return customAlertDialog()
  // }
  String getDate() {
    return DateFormat('d MMMM y').format(now.value);
  }

  void pageTransition(BuildContext context, Widget page) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) => page));
  }

  void pageGo(BuildContext context, Widget page) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 100),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) => page));
  }
}
