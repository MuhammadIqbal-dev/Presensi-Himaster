import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:presensi_himaster/models/user_model.dart' as um;
import 'package:presensi_himaster/models/list_absen.dart' as la;
import 'package:presensi_himaster/services/presensi_api.dart';

class MainController extends GetxController {
  RxInt enabledProfile = 0.obs;
  RxList droppedDown = [].obs;
  RxBool isLogin = false.obs;
  RxBool isLoading = false.obs;
  Rx<um.Data> userData = um.Data().obs;
  Rx<la.Data> userAbsen = la.Data().obs;
  RxBool stateChange = false.obs;
  RxMap statusMap = {}.obs;
  RxBool isThereData = false.obs;

  // API
  loginController(String email, String pass) async {
    if (email == "" || pass == "") {
      return;
    }
    um.Data? data = await PresensiApi.loginAccount(email, pass);
    if (data == null) {
      isLogin.value = false;
    } else {
      userData.value = data;
      await fetchDataAbsen();
      setup();

      isLogin.value = true;
    }
  }

  Future<bool> logoutController(String token) async {
    return await PresensiApi.logoutAccount(token);
  }

  Future fetchDataAbsen() async {
    la.Data? data = await PresensiApi.fetchAbsen(userData.value.accessToken!);
    if (data == null) {
    } else {
      userAbsen.value = data;
    }
  }

  reFetch() async {
    await fetchDataAbsen();
  }

  setup() async{
    int statusAbsen = 2;
    for (la.Event dataAbsen in userAbsen.value.user!.event) {
      statusAbsen = 2;

      for (la.Code dataAbsenCode in dataAbsen.code) {
        for (la.History data in userAbsen.value.history!) {

          if (dataAbsenCode.id == data.codeId) {
            statusAbsen = 1;
            statusMap[dataAbsenCode.id] = statusAbsen;
            break;
          }
        }
        if (statusMap.containsKey(dataAbsenCode.id)) {
          continue;
        }
        if (DateTime.now().isAfter(dataAbsenCode.start) &
            DateTime.now().isBefore(dataAbsenCode.end)) {
          statusAbsen = 3;
          statusMap[dataAbsenCode.id] = statusAbsen;
        } else if (DateTime.now().isAfter(dataAbsenCode.end)) {
          statusAbsen = 2;
          statusMap[dataAbsenCode.id] = statusAbsen;
        }
        statusMap[dataAbsenCode.id] = statusAbsen;
      }
    }
    return statusAbsen;
  }

  int getStatus(la.Code dataAbsenCode) {
    int statusAbsen = 2;
    for (la.History data in userAbsen.value.history!) {
      if (dataAbsenCode.id == data.codeId) {
        statusAbsen = 1;
        return statusAbsen;
      }
    }
    if (DateTime.now().isAfter(dataAbsenCode.start) &
        DateTime.now().isBefore(dataAbsenCode.end)) {
      statusAbsen = 3;
      return statusAbsen;
    } else if (DateTime.now().isAfter(dataAbsenCode.end)) {
      statusAbsen = 2;
    }

    return statusAbsen;
  }

  // PAGE TRANSITION
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
