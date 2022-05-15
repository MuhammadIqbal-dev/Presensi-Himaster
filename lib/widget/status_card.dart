import 'package:flutter/material.dart';
import 'package:presensi_himaster/theme.dart';

class StatusCard extends StatelessWidget {
  StatusCard({Key? key, required this.status}) : super(key: key);
  int status;
  @override
  Widget build(BuildContext context) {
    if (status == 1) {
      return Container(
        height: 42,
        width: 0.22 * getWidth(context),
        decoration: roundedBox(lightGreenCr, 6),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/imgs/ui_y.png'),
            Expanded(
                child: Text(
              'Hadir',
              style: semiBoldStyle(8, greenCr),
              textAlign: TextAlign.center,
            )),
          ],
        ),
      );
    } else if (status == 2) {
      return Container(
        height: 42,
        width: 0.22 * getWidth(context),
        decoration: roundedBox(lightRedCr, 6),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/imgs/ui_x.png'),
            Expanded(
                child: Text(
              'Tidak Hadir',
              style: semiBoldStyle(8, redCr),
              textAlign: TextAlign.center,
            )),
          ],
        ),
      );
    } else {
      return Container(
        height: 42,
        width: 0.22 * getWidth(context),
        decoration: roundedBox(lightYellowCr, 6),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/imgs/ui_loading.png'),
            Expanded(
                child: Text(
              'Belum Absen',
              style: semiBoldStyle(8, yellowCr),
              textAlign: TextAlign.center,
            )),
          ],
        ),
      );
    }
  }
}
