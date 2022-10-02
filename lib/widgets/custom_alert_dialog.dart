import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/models/list_absen.dart';
import 'package:presensi_himaster/services/presensi_api.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/custom_alert_loading.dart';
import 'package:presensi_himaster/widgets/custom_alert_responses.dart';

class CustomAlertDialog {
  final TextEditingController _textController = TextEditingController();
  final mainController = Get.find<MainController>();

  bool isValidate = false;

  showAlertDialog(
    BuildContext context,
    String title,
    String desc,
    String service,
    var dataCode,
    String token,
  ) {
    // set up the buttons
    Widget cancelButton = OutlinedButton(
      child: Text(
        "Batal",
        style: semiBoldStyle(13, grayCr),
      ),
      style: roundedButton(Colors.transparent),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = OutlinedButton(
      child: Text(
        "Submit",
        style: semiBoldStyle(13, white),
      ),
      style: roundedButton(blueCr),
      onPressed: () {
        // func;
        if (service == 'kegiatan') {
          postKodeKegiatan(context, dataCode, token);
        } else {
          postKodePresensi(context, dataCode, token);
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        title,
        style: semiBoldStyle(14, black),
      ),
      content: SizedBox(
        height: 0.10 * getHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              desc,
              style: textStyle(10, black),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Input kode unik',
                  hintStyle: textStyle(13, grayCr)),
              controller: _textController,
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      actions: [
        SizedBox(
            height: 48, width: 0.25 * getWidth(context), child: cancelButton),
        SizedBox(
            height: 48, width: 0.25 * getWidth(context), child: continueButton),
      ],
      actionsPadding: const EdgeInsets.only(bottom: 16),
      actionsAlignment: MainAxisAlignment.center,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

    // show the dialog
  }

  postKodePresensi(BuildContext context, Code dataCode, String token) async {
    log('asdaasd');
    Navigator.pop(context);
    CustomAlertLoading().showAlertDialog(context);
    await Future.delayed(const Duration(milliseconds: 500));

    if (_textController.text == dataCode.code) {
      isValidate = await PresensiApi.postAbsen(dataCode.code,
          _textController.text, dataCode.id, 'MOBILE', dataCode.title, token);
    } else {
      isValidate = false;
    }
    Navigator.pop(context);
    CustomAlertResponses().showAlertDialog(context, isValidate, dataCode);
  }

  Future postKodePresensiQR(
      BuildContext context, Code dataCode, String kode, String token) async {
    if (mainController.isLoadingKode.value == false) {
      mainController.isLoadingKode(true);
      CustomAlertLoading().showAlertDialog(context);
      await Future.delayed(const Duration(milliseconds: 500));

      if (kode == dataCode.code) {
        isValidate = await PresensiApi.postAbsen(
            dataCode.code, kode, dataCode.id, 'MOBILE', dataCode.title, token);
      } else {
        isValidate = false;
      }
      Navigator.pop(context);

      CustomAlertResponses().showAlertDialog(context, isValidate, dataCode).then((value) => Navigator.pop(context));
      
    }
  }

  postKodeKegiatan(BuildContext context, var dataCode, String token) async {
    // Parameter dataCode tidak dipakai
    Navigator.pop(context);
    CustomAlertLoading().showAlertDialog(context);
    await Future.delayed(const Duration(milliseconds: 500));
    if (_textController.text.isNotEmpty) {
      isValidate = await PresensiApi.postKegiatan(_textController.text, token);
    } else {
      isValidate = false;
    }
    Navigator.pop(context);
    CustomAlertResponses().showAlertDialogKegiatan(context, isValidate);
  }
}
