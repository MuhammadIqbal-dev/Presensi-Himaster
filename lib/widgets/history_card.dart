import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/models/list_absen.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/divisi_card.dart';
import 'package:presensi_himaster/widgets/status_card.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard(
      {Key? key, this.status, this.idx, this.enable, this.keys, this.values})
      : super(key: key);
  final mainController = Get.find<MainController>();
  final bool? status;
  final int? idx;
  final int? enable;
  final int? keys;
  final int? values;
  bool isThereData = false;
  @override
  Widget build(BuildContext context) {
    
    for (Event element in mainController.userAbsen.value.user!.event) {
      for (Code data in element.code) {
    String date = DateFormat('d MMM y').format(data.start);
        String start = DateFormat.Hm().format(data.start);
        String end = DateFormat.Hm().format(data.end);
        String formattedTime = "$start - $end Wib";
        if (data.id == keys) {
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
                            width: 0.02 * getWidth(context),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tanggal',
                                style: textStyle(10, lightGrayCr),
                              ),
                              Text(
                                date,
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
                            width: 0.02 * getWidth(context),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title',
                                style: textStyle(10, lightGrayCr),
                              ),
                              Text(
                                data.title,
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
                            width: 0.02 * getWidth(context),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status Kehadiran:',
                                style: textStyle(10, lightGrayCr),
                              ),
                              StatusCard(status: values!)
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
                            width: 0.02 * getWidth(context),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Waktu',
                                style: textStyle(10, lightGrayCr),
                              ),
                              Text(
                                formattedTime,
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
                            width: 0.02 * getWidth(context),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tempat',
                                style: textStyle(10, lightGrayCr),
                              ),
                              Text(
                                data.place!,
                                style: textStyle(12, grayCr),
                              ),
                            ],
                          )
                        ],
                      ),
                      // DIVISI PENYELENGARA, SOOON
                      // Row(
                      //   children: [
                      //     Image.asset(
                      //       'assets/imgs/info_icon.png',
                      //       color: grayCr,
                      //     ),
                      //     SizedBox(
                      //       width: 0.02 * getWidth(context),
                      //     ),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           'Divisi Penyelenggara',
                      //           style: textStyle(10, lightGrayCr),
                      //         ),
                      //         const DivisiCard(name: 'Divisi Keilmuan')
                      //       ],
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Column(
                    children: [
                      const Spacer(
                        flex: 3,
                      ),
                      InkWell(
                          onTap: () {
                            if (mainController.droppedDown[idx!]) {
                              mainController.droppedDown[idx!] = false;
                            } else {
                              mainController.droppedDown[idx!] = true;
                            }
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 34,
                          )),
                      const Spacer(
                        flex: 17,
                      ),
                    ],
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
                            width: 0.02 * getWidth(context),
                          ),
                          Text(
                            date,
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
                            width: 0.02 * getWidth(context),
                          ),
                          Text(
                            data.title,
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
                            width: 0.02 * getWidth(context),
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
                    child: const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 34,
                    ),
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
    }
    return Container();
  }
}
