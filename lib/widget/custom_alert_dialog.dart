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
      title: Text(title, style: semiBoldStyle(14, black),),
      content: SizedBox(
        height: 0.08 * getHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(desc, style: textStyle(10, black),),
            
            TextField(
              decoration: const InputDecoration(hintText: 'Input kode unik', hintStyle: TextStyle(fontSize: 13)),
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
}
