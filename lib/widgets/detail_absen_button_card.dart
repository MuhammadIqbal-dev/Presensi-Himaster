import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/custom_alert_dialog.dart';

class AbsenButtonCard extends StatelessWidget {
  AbsenButtonCard({Key? key}) : super(key: key);
  final MainController mainController = Get.find<MainController>();
  final CustomAlertDialog customAlertDialog = CustomAlertDialog();


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: roundedShadowBox(white, 12),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Absen Disini',
            style: semiBoldStyle(14, grayCr),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 48,
                width: 0.4 * getWidth(context),
                child: OutlinedButton(
                    onPressed: () {
                      customAlertDialog.showAlertDialog(
                          context, 'Masukkan Kode Presensi', 'KODE PRESENSI');
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
                    onPressed: () {},
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
          Spacer(),
        ],
      ),
    );
  }
}
