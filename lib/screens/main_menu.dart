import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controllers/date_controller.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/models/user_model.dart';
import 'package:presensi_himaster/screens/calendar.dart';
import 'package:presensi_himaster/screens/profile.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/absen_card_builder.dart';
import 'package:presensi_himaster/widgets/banner_swipe.dart';
import 'package:presensi_himaster/widgets/category_builder.dart';
import 'package:presensi_himaster/widgets/custom_alert_dialog.dart';
import 'package:presensi_himaster/widgets/stats_jadwal_widget.dart';

class MainMenu extends StatelessWidget {
  MainMenu({Key? key}) : super(key: key);

  final mainController = Get.find<MainController>();
  final dateController = Get.put(DateController());
  final CustomAlertDialog customAlertDialog = CustomAlertDialog();

  @override
  Widget build(BuildContext context) {
    User? user = mainController.userData.value.user;

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RefreshIndicator(
              color: blueCr,
              onRefresh: () {
                mainController.setup();
                return mainController.reFetch();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // const Spacer(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            mainController.pageGo(context, Profile());
                          },
                          child: Row(
                            children: [
                              const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/imgs/pp.png')),
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
                                    '${user?.name}',
                                    style: semiBoldStyle(14, black),
                                  )
                                ],
                              ),
                            ],
                          ),
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
                      height: 0.21 *getHeight(context),
                      child: BannerSwap(),
                      
                    ),
                    // const Spacer(),
                    SizedBox(
                      height:
                          0.02 * getHeight(context) + 0.005 * getWidth(context),
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
                                    dateController.updateDate();
                                    return Text(
                                      dateController.getDate(),
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
                            height: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                // ALERT DIALOG UNTUK KEGIATAN
                                customAlertDialog.showAlertDialog(
                                    context,
                                    'Masukkan Kode Kegiatan',
                                    'KODE KEGIATAN',
                                    'kegiatan',
                                    '',
                                    mainController.userData.value.accessToken!);
                              },
                              child: const Text('+ Kegiatan'),
                              style: roundedButton(darkGreenCr),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height:
                          0.02 * getHeight(context) + 0.005 * getWidth(context),
                    ),
                    SizedBox(
                      height: 35,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CategoryBuilder()),
                    ),

                    SizedBox(
                      height:
                          0.02 * getHeight(context) + 0.005 * getWidth(context),
                    ),
                    SizedBox(
                      height: 230,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: AbsenCardBuilder()),
                    ),
                    SizedBox(
                      height:
                          0.02 * getHeight(context) + 0.005 * getWidth(context),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 48),
                      child: SizedBox(
                        width: double.infinity,
                        height: 0.065 * getHeight(context),
                        child: OutlinedButton(
                            style: roundedOutButton(Colors.transparent, blueCr),
                            onPressed: () {
                              mainController.pageGo(context, Calendar());
                            },
                            child: Text(
                              'Lihat Semua Jadwal',
                              style: textStyle(14, blueCr),
                            )),
                      ),
                    ),
                    // SizedBox(
                    //   height:
                    //       0.02 * getHeight(context) + 0.005 * getWidth(context),
                    // ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(
                    //     'Analytics Jadwal',
                    //     style: semiBoldStyle(12, black),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height:
                    //       0.02 * getHeight(context) + 0.005 * getWidth(context),
                    // ),
                    // Container(
                    //   height: 160,
                    //   decoration: roundedShadowBox(Colors.transparent, 12),
                    //   child: Align(
                    //       alignment: Alignment.centerLeft,
                    //       child: StatsJadwalWidget()),
                    // ),
                    // SizedBox(
                    //   height:
                    //       0.02 * getHeight(context) + 0.005 * getWidth(context),
                    // ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
