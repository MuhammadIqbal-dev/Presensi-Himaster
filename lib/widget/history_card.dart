import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controller/main_controller.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widget/status_card.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard({Key? key, this.status, this.idx, this.enable}) : super(key: key);
  final mainController = Get.find<MainController>();
  final bool? status;
  final int? idx;
  final int? enable;
  @override
  Widget build(BuildContext context) {
    if (status!) {
      return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        margin: const EdgeInsets.all(10),
        height: 312,
        decoration: roundedShadowBox(white, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/imgs/calender_icon.png',
                      color: grayCr,
                    ),
                    SizedBox(
                      width: 0.02* getWidth(context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tanggal',
                          style: textStyle(10, lightGrayCr),
                        ),
                        Text(
                          '01 January 2022',
                          style: textStyle(12, grayCr),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/imgs/title_icon.png',
                      color: grayCr,
                    ),
                    SizedBox(
                      width: 0.02* getWidth(context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tanggal',
                          style: textStyle(10, lightGrayCr),
                        ),
                        Text(
                          'IT Club Pertemuan Ke 1',
                          style: semiBoldStyle(12, grayCr),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/imgs/info_icon.png',
                      color: grayCr,
                    ),
                    SizedBox(
                      width: 0.02* getWidth(context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status Kehadiran:',
                          style: textStyle(10, lightGrayCr),
                        ),
                        StatusCard(status: enable!)
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/imgs/time_icon.png',
                      color: grayCr,
                    ),
                    SizedBox(
                      width: 0.02* getWidth(context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Waktu',
                          style: textStyle(10, lightGrayCr),
                        ),
                        Text(
                          '08:00 - 12:00 WIB',
                          style: textStyle(12, grayCr),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/imgs/loc_icon.png',
                      color: grayCr,
                    ),
                    SizedBox(
                      width: 0.02* getWidth(context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tempat',
                          style: textStyle(10, lightGrayCr),
                        ),
                        Text(
                          'Ruang Siskom 3',
                          style: textStyle(12, grayCr),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/imgs/info_icon.png',
                      color: grayCr,
                    ),
                    SizedBox(
                      width: 0.02* getWidth(context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Divisi Penyelenggara',
                          style: textStyle(10, lightGrayCr),
                        ),
                        Text(
                          'TODO DIVISI',
                          style: textStyle(12, grayCr),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const Spacer(
              flex: 4,
            ),
            InkWell(
              onTap: () {
                if (mainController.droppedDown[idx!]) {
                  mainController.droppedDown[idx!] = false;
                } else {
                  mainController.droppedDown[idx!] = true;
                }
              },
              child: const Icon(Icons.keyboard_arrow_up_rounded, size: 34,),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        margin: const EdgeInsets.all(10),
        decoration: roundedShadowBox(white, 12),
        height: 112,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/imgs/calender_icon.png',
                      color: grayCr,
                    ),
                    SizedBox(
                      width: 0.02* getWidth(context),
                    ),
                    Text(
                      '01 January 2022',
                      style: textStyle(12, grayCr),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/imgs/title_icon.png',
                      color: grayCr,
                    ),
                    SizedBox(
                      width: 0.02* getWidth(context),
                    ),
                    Text(
                      'IT Club Pertemuan Ke 1',
                      style: semiBoldStyle(12, grayCr),
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/imgs/info_icon.png',
                      color: grayCr,
                    ),
                    SizedBox(
                      width: 0.02* getWidth(context),
                    ),
                    Text(
                      'Status Kehadiran :',
                      style: textStyle(12, grayCr),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(
              flex: 4,
            ),
            InkWell(
              onTap: () {
                if (mainController.droppedDown[idx!]) {
                  mainController.droppedDown[idx!] = false;
                } else {
                  mainController.droppedDown[idx!] = true;
                }
              },
              child: const Icon(Icons.keyboard_arrow_right_rounded, size: 34,),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      );
    }
  }
}
