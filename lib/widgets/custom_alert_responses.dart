import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/models/list_absen.dart';
import 'package:presensi_himaster/theme.dart';

class CustomAlertResponses {
  MainController _mainController = Get.find<MainController>();

  showAlertDialog(BuildContext context, bool isValidate, Code dataCode) {
    Widget okeButton(String text) {
      return OutlinedButton(
        child: Text(
          text,
          style: semiBoldStyle(13, white),
        ),
        style: roundedButton(blueCr),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }

    // set up the AlertDialog
    AlertDialog alertSalah = AlertDialog(
      insetPadding: EdgeInsets.symmetric(vertical: 0.15 * getHeight(context)),
      title: Center(
          child: Text(
        'Aww!!',
        style: semiBoldStyle(14, black),
      )),
      content: SizedBox(
        width: 0.30 * getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/imgs/failed.png',
              height: 0.35 * getHeight(context),
            ),
            Text(
              'Kamu gagal melakukan presensi, Coba cek kodenya lagi Ya!',
              textAlign: TextAlign.center,
              style: textStyle(12, grayCr),
            )
          ],
        ),
      ),
      actions: [
        SizedBox(width: double.infinity, height: 48, child: okeButton('Oke!!'))
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      contentPadding: const EdgeInsets.only(right: 28, left: 28),
      actionsPadding: const EdgeInsets.only(right: 20, left: 20, bottom: 16),
      actionsAlignment: MainAxisAlignment.center,
    );

    // ALERT KETIKA BERHASIL
    AlertDialog alertBenar = AlertDialog(
      insetPadding: EdgeInsets.symmetric(vertical: 0.15 * getHeight(context)),
      title: Center(
          child: Text(
        'Yeay!!',
        style: semiBoldStyle(14, black),
      )),
      content: SizedBox(
        width: 0.30 * getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/imgs/success.png',
              height: 0.35 * getHeight(context),
            ),
            Text(
              'Kamu berhasil melakukan presensi, Selamat melanjutkan kegiatan Ya!',
              textAlign: TextAlign.center,
              style: textStyle(12, grayCr),
            )
          ],
        ),
      ),
      actions: [
        SizedBox(width: double.infinity, height: 48, child: okeButton('Siap!!'))
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      contentPadding: const EdgeInsets.only(right: 28, left: 28),
      actionsPadding: const EdgeInsets.only(right: 20, left: 20, bottom: 16),
      actionsAlignment: MainAxisAlignment.center,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (isValidate) {
          _mainController.reFetch();
          return alertBenar;
        }
        return alertSalah;
      },
    ).then((value) => _mainController.statusMap[dataCode.id] =
        _mainController.getStatus(dataCode));

    // show the dialog
  }
  showAlertDialogKegiatan(BuildContext context, bool isValidate) {
    Widget okeButton(String text) {
      return OutlinedButton(
        child: Text(
          text,
          style: semiBoldStyle(13, white),
        ),
        style: roundedButton(blueCr),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }

    // set up the AlertDialog
    AlertDialog alertSalah = AlertDialog(
      insetPadding: EdgeInsets.symmetric(vertical: 0.15 * getHeight(context)),
      title: Center(
          child: Text(
        'Aww!!',
        style: semiBoldStyle(14, black),
      )),
      content: SizedBox(
        width: 0.30 * getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/imgs/failed.png',
              height: 0.35 * getHeight(context),
            ),
            Text(
              'Kamu gagal menambahkan kegiatan, Coba cek kodenya lagi Ya!',
              textAlign: TextAlign.center,
              style: textStyle(12, grayCr),
            )
          ],
        ),
      ),
      actions: [
        SizedBox(width: double.infinity, height: 48, child: okeButton('Oke!!'))
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      contentPadding: const EdgeInsets.only(right: 28, left: 28),
      actionsPadding: const EdgeInsets.only(right: 20, left: 20, bottom: 16),
      actionsAlignment: MainAxisAlignment.center,
    );

    // ALERT KETIKA BERHASIL
    AlertDialog alertBenar = AlertDialog(
      insetPadding: EdgeInsets.symmetric(vertical: 0.15 * getHeight(context)),
      title: Center(
          child: Text(
        'Yeay!!',
        style: semiBoldStyle(14, black),
      )),
      content: SizedBox(
        width: 0.30 * getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/imgs/success.png',
              height: 0.35 * getHeight(context),
            ),
            Text(
              'Kamu berhasil menambahkan kegiatan, jangan lupa absen nya Ya!',
              textAlign: TextAlign.center,
              style: textStyle(12, grayCr),
            )
          ],
        ),
      ),
      actions: [
        SizedBox(width: double.infinity, height: 48, child: okeButton('Siap!!'))
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      contentPadding: const EdgeInsets.only(right: 28, left: 28),
      actionsPadding: const EdgeInsets.only(right: 20, left: 20, bottom: 16),
      actionsAlignment: MainAxisAlignment.center,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (isValidate) {
          _mainController.reFetch();
          return alertBenar;
        }
        return alertSalah;
      },
    );

    // show the dialog
  }
}
