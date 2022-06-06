import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  Rx<DateTime> now = DateTime.now().obs;

  final Duration _duration = const Duration(seconds: 10);
  void updateDate() {
    Timer.periodic(_duration, (tes) {
      now.value = DateTime.now();
    });
  }

  String getDate() {
    return DateFormat('d MMMM y').format(now.value);
  }
}
