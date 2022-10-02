import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/models/list_absen.dart';
import 'package:presensi_himaster/screens/qr_scan.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/custom_alert_dialog.dart';

class AbsenButtonCard extends StatelessWidget {
  AbsenButtonCard({Key? key, required this.dataCode}) : super(key: key);
  final MainController mainController = Get.find<MainController>();
  final CustomAlertDialog customAlertDialog = CustomAlertDialog();
  final Code dataCode;

  @override
  Widget build(BuildContext context) {
    return Obx((() {
      if (mainController.statusMap[dataCode.id] == 1) {
        return Column(
          children: [
            const Spacer(),
            Container(
                decoration: roundedShadowBox(white, 12),
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  decoration: roundedBox(lightGreenCr, 6),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/imgs/ui_y_big.png',
                      ),
                      Expanded(
                          child: Text(
                        'Terimakasih sudah hadir Ya!',
                        style: semiBoldStyle(13, greenCr),
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                )),
          ],
        );
      } else if (mainController.statusMap[dataCode.id] == 2) {
        return Column(
          children: [
            const Spacer(),
            Container(
                decoration: roundedShadowBox(white, 12),
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  decoration: roundedBox(lightRedCr, 6),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/imgs/ui_x_big.png',
                      ),
                      Expanded(
                          child: Text(
                        'Lain kali, jangan sampai tidak hadir!',
                        style: semiBoldStyle(13, redCr),
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                )),
          ],
        );
      }
      return Container(
        decoration: roundedShadowBox(white, 12),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Absen Disini',
              style: semiBoldStyle(14, grayCr),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 48,
                  width: 0.4 * getWidth(context),
                  child: OutlinedButton(
                      onPressed: () {
                        customAlertDialog.showAlertDialog(
                            context,
                            'Masukkan Kode Presensi',
                            'KODE PRESENSI',
                            'presensi',
                            dataCode,
                            mainController.userData.value.accessToken!);
                      },
                      style: roundedOutButton(white, blueCr),
                      child: Text(
                        'Input Kode',
                        textAlign: TextAlign.center,
                        style: semiBoldStyle(13, blueCr),
                      )),
                ),
                const SizedBox(
                  width: 14,
                ),
                SizedBox(
                  height: 48,
                  width: 0.4 * getWidth(context),
                  child: OutlinedButton(
                      onPressed: () {
                        mainController.pageGo(context, QrScan());
                      },
                      style: roundedButton(blueCr),
                      child: Row(
                        children: [
                          const Icon(Icons.qr_code_rounded, size: 24),
                          Expanded(
                            child: Text(
                              'Scan QR',
                              textAlign: TextAlign.center,
                              style: semiBoldStyle(13, white),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      );
    }));
  }
}
