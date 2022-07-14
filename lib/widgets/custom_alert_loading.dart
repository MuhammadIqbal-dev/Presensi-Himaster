import 'package:flutter/material.dart';
import 'package:presensi_himaster/theme.dart';

class CustomAlertLoading {
  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                color: blueCr,
                
              ),
            ),
          ],
        )),
    );
    showDialog(
      barrierDismissible: false,
      // barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

    // show the dialog
  }
}
