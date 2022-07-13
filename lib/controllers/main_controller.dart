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

  


  // API
  loginController(String email, String pass) async{
    if (email == "" || pass == "") {
      return;
    }
    um.Data? data = await PresensiApi.loginAccount(email, pass);
    print('aaa');
    if (data == null) {
      isLogin.value = false;
    }else{
      userData.value = data;
      isLogin.value = true;
    }
    print(userData.value.accessToken);


  }

  Future<bool> logoutController(String token) async{
    print(token);
    return await PresensiApi.logoutAccount(token);
  }

  fetchDataAbsen(String token) async{
    isLoading.value = true;
    la.Data? data = await PresensiApi.fetchAbsen(token);
    if (data == null){
      print('data absen null');
    }
    else{
      userAbsen.value = data;
      isLoading.value = false;
    }
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
