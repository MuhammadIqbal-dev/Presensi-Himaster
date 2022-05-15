import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controller/mainController.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widget/absenCardBuilder.dart';
import 'package:presensi_himaster/widget/categoryBuilder.dart';
import 'package:presensi_himaster/widget/custom_alert_dialog.dart';
import 'package:presensi_himaster/widget/statsJadwalWidget.dart';

class MainMenu extends StatelessWidget {
  MainMenu({Key? key}) : super(key: key);

  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.ac_unit),
                      const SizedBox(
                        width: 14.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat datang',
                            style: textStyle(12, grayCr),
                          ),
                          Text(
                            'Richard felyn',
                            style: semiBoldStyle(14, black),
                          )
                        ],
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                      const Icon(Icons.notifications_none_rounded),
                    ],
                  ),
                  SizedBox(
                    height: 0.02 * getHeight(context),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    height: 140,
                    decoration: roundedShadowBox(grayCr, 12),
                  ),
                  // const Spacer(),
                  SizedBox(
                    height: 0.02 * getHeight(context) + 0.005 * getWidth(context),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jadwal Kegiatan Hari ini',
                              style: semiBoldStyle(12, black),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_rounded,
                                  color: grayCr,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Obx(() {
                                  mainController.updateDate();
                                  return Text(
                                    mainController.getDate(),
                                    style: textStyle(12, grayCr),
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.only(top: 2, bottom: 2),
                          height: double.infinity ,
                          child: OutlinedButton(
                            onPressed: () {
                              mainController.customAlertDialog.showAlertDialog(context, 'tes', 'tes');
                            },
                            child: const Text('+ Kegiatan'),
                            style: roundedButton(darkGreenCr),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.02 * getHeight(context) + 0.005 * getWidth(context),
                  ),
                  SizedBox(
                    height: 35,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CategoryBuilder()),
                  ),

                  SizedBox(
                    height: 0.02 * getHeight(context) + 0.005 * getWidth(context),
                  ),
                  Container(
                    height: 220,
                    decoration: roundedShadowBox(Colors.transparent, 12),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: AbsenCardBuilder()),
                  ),
                  SizedBox(
                    height: 0.02 * getHeight(context) + 0.005 * getWidth(context),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 48),
                    child: SizedBox(
                      width: double.infinity,
                      height: 0.065 * getHeight(context),
                      child: OutlinedButton(
                          style: roundedOutButton(Colors.transparent, blueCr),
                          onPressed: () {},
                          child: Text(
                            'Lihat Semua Jadwal',
                            style: textStyle(14, blueCr),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 0.02 * getHeight(context) + 0.005 * getWidth(context),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Analytics Jadwal',
                      style: semiBoldStyle(12, black),
                    ),
                  ),
                  SizedBox(
                    height: 0.02 * getHeight(context) + 0.005 * getWidth(context),
                  ),
                  Container(
                    height: 160,
                    decoration: roundedShadowBox(Colors.transparent, 12),
                    child: const Align(
                        alignment: Alignment.centerLeft,
                        child: StatsJadwalWidget()),
                  ),
                  SizedBox(
                    height: 0.02 * getHeight(context) + 0.005 * getWidth(context),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
