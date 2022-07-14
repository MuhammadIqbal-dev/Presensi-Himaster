import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presensi_himaster/models/user_model.dart' as um;
import 'package:presensi_himaster/models/list_absen.dart' as la;
import 'package:presensi_himaster/services/presensi_api.dart';
import 'package:presensi_himaster/widgets/custom_alert_dialog.dart';

class MainController extends GetxController {


  RxInt enabledProfile = 0.obs;
  RxList droppedDown = [].obs;
  RxBool isLogin = false.obs;
  RxBool isLoading = false.obs;
  Rx<um.Data> userData = um.Data().obs;
  Rx<la.Data> userAbsen = la.Data().obs;
  RxBool stateChange = false.obs;
  RxInt statusChange = 0.obs;

  


  // API
  loginController(String email, String pass) async{
    if (email == "" || pass == "") {
      return;
    }
    um.Data? data = await PresensiApi.loginAccount(email, pass);
    if (data == null) {
      isLogin.value = false;
    }else{
      userData.value = data;
      await fetchDataAbsen();
      isLogin.value = true;
    }


  }

  Future<bool> logoutController(String token) async{
    return await PresensiApi.logoutAccount(token);
  }

  Future fetchDataAbsen() async{
    la.Data? data = await PresensiApi.fetchAbsen(userData.value.accessToken!);
    if (data == null){
    }
    else{
      userAbsen.value = data;
    }
  }

  reFetch() async{
    await fetchDataAbsen();
  }

  int getStatus(la.Code dataAbsenCode) {
    int statusAbsen = 2;
    for (la.History data in userAbsen.value.history!) {
      if (dataAbsenCode.id == data.codeId) {
        return statusAbsen = 1;
      }
    }
    if (DateTime.now().isAfter(dataAbsenCode.start) &
        DateTime.now().isBefore(dataAbsenCode.end)) {
      return statusAbsen = 3;
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
