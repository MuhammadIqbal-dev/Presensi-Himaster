import 'package:flutter/material.dart';
import 'package:presensi_himaster/theme.dart';

class CustomAlertDialog {
  final TextEditingController _textController = TextEditingController();

  showAlertDialog(BuildContext context, String title, String desc) {
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
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: SizedBox(
        height: 0.14 * getHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(desc),
            TextField(
              decoration: const InputDecoration(hintText: 'Input kode unik'),
              controller: _textController,
              
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))) ,
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

    // show the dialog
  }
}
