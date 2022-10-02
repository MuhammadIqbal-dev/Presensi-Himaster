import 'package:flutter/material.dart';
import 'package:presensi_himaster/theme.dart';

class AlertResponses {
  showAlertDialog(BuildContext context, bool isValidate, String user) async {
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
        'Whoops!!',
        style: semiBoldStyle(14, black),
      )),
      content: Container(
        width: 0.30 * getWidth(context),
        padding: const EdgeInsets.all(20),
        child: Text(
          'Email Atau Password kamu salah, cek lagi ya!',
          textAlign: TextAlign.center,
          style: textStyle(12, grayCr),
        ),
      ),
      actions: [
        SizedBox(width: double.infinity, height: 48, child: okeButton('Sipp!!'))
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
        'Welcome!',
        style: semiBoldStyle(14, black),
      )),
      content: Container(
        width: 0.30 * getWidth(context),
        padding: const EdgeInsets.all(20),
        child: Text(
          'Selamat datang \n$user!',
          textAlign: TextAlign.center,
          style: semiBoldStyle(12, grayCr),
        ),
      ),
      actions: [
        SizedBox(
            width: double.infinity, height: 48, child: okeButton('Okayyy!!'))
      ],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      contentPadding: const EdgeInsets.only(right: 28, left: 28),
      actionsPadding: const EdgeInsets.only(right: 20, left: 20, bottom: 16),
      actionsAlignment: MainAxisAlignment.center,
    );

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        if (isValidate) {
          return alertBenar;
        }
        return alertSalah;
      },
    );

    // show the dialog
  }

  // show the dialog
}
