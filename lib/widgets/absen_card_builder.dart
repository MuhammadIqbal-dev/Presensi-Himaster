import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/models/list_absen.dart';
import 'package:presensi_himaster/screens/detail_absen.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/status_card.dart';

class AbsenCardBuilder extends StatelessWidget {
  AbsenCardBuilder({Key? key}) : super(key: key);


  final MainController mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        List<Event> dataAbsen = mainController.userAbsen.value.user!.event;
        List<History> dataHistory = mainController.userAbsen.value.history!;
        mainController.isThereData.value = false;
        for (var element in dataAbsen) {
          for (var data in element.code) {
            if (data.status == 1 && element.status == 1) {
              mainController.isThereData.value = true;
              break;
            }
          }
        }
        if (mainController.isThereData.value) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: dataAbsen.length,
              itemBuilder: (context, index) {
                var dataAbsenCode = dataAbsen[index].code;
                if (dataAbsen[index].status == 1) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: dataAbsenCode.length,
                      itemBuilder: (context, index) {
                        String start =
                            DateFormat.Hm().format(dataAbsenCode[index].start);
                        String end =
                            DateFormat.Hm().format(dataAbsenCode[index].end);
                        String formattedTime = "$start - $end Wib";
                        int statusAbsen =
                            mainController.getStatus(dataAbsenCode[index]);
                        if (dataAbsenCode[index].status == 1) {
                          return Container(
                            width: 192,
                            decoration: roundedShadowBox(white, 12),
                            padding: const EdgeInsets.all(16.0),
                            margin: const EdgeInsets.only(
                                right: 4.0, left: 4.0, top: 8.0, bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx((() {
                                  mainController.stateChange();
                                  return StatusCard(
                                    status: statusAbsen,
                                  );
                                })),
                                const Spacer(
                                  flex: 2,
                                ),
                                // TITLE
                                Row(
                                  children: [
                                    Image.asset('assets/imgs/title_icon.png'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Text(
                                        dataAbsenCode[index].title,
                                        overflow: TextOverflow.ellipsis,
                                        style: semiBoldStyle(12, grayCr),
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                // WAKTU
                                Row(
                                  children: [
                                    Image.asset('assets/imgs/time_icon.png'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      formattedTime,
                                      style: boldStyle(12, grayCr),
                                    )
                                  ],
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                // LOKASI
                                Row(
                                  children: [
                                    Image.asset('assets/imgs/loc_icon.png'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Text(
                                        dataAbsenCode[index].place!,
                                        overflow: TextOverflow.ellipsis,
                                        style: semiBoldStyle(12, grayCr),
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Expanded(
                                    flex: 4,
                                    child: InkWell(
                                      onTap: () {
                                        mainController.pageGo(
                                          context,
                                          DetailAbsen(
                                            history: dataHistory,
                                            dataCode: dataAbsenCode[index],
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            'Absen Sekarang',
                                            style: semiBoldStyle(10, blueCr),
                                          ),
                                          const Spacer(),
                                          Image.asset(
                                            'assets/imgs/next.png',
                                            height: 32,
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          );
                        }
                        else{
                          return Container();
                        }
                      });
                }
                return Container();
              });
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/imgs/no-resultss.png',
                    height: 200,
                  ),
                  Text(
                    'Tidak ada Absen Aktif',
                    style: semiBoldStyle(12, grayCr),
                  )
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
