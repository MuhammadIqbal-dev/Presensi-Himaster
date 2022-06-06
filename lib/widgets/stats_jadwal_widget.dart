import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/screens/profile.dart';
import 'package:presensi_himaster/theme.dart';

class StatsJadwalWidget extends StatelessWidget {
  StatsJadwalWidget({Key? key}) : super(key: key);
  final MainController mainController = Get.find<MainController>();


  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        Container(
          width: 130,
          margin: const EdgeInsets.only(right: 8.0),
          padding: const EdgeInsets.all(16),
          decoration: roundedGradBox(6),
          child: Column(
            children: [
              const Icon(
                Icons.api_rounded,
                size: 20,
              ),
              const Spacer(
                flex: 3,
              ),
              Text('Persen Kehadiran', style: semiBoldStyle(10, white), textAlign: TextAlign.center,),
              const Spacer(
                flex: 1,
              )
            ],
          ),
        ),
        Container(
          width: 130,
          margin: const EdgeInsets.only(right: 8.0),
          padding: const EdgeInsets.all(16),
          decoration: roundedBox(white, 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/imgs/total_kegiatan.png'),
              const Spacer(),
              Text(
                '300',
                style: semiBoldStyle(24, black),
              ),
              Text(
                'Total Kegiatan',
                style: textStyle(10, grayCr),
              ),
              const Spacer(),
              Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                          mainController.pageGo(context, Profile());
                        },
                    child: Row(
                      children: [
                        Text(
                          'Lihat History',
                          style: semiBoldStyle(10, blueCr),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/imgs/next.png',
                          height: 15,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
        Container(
          width: 130,
          margin: const EdgeInsets.only(right: 8.0),
          padding: const EdgeInsets.all(16),
          decoration: roundedBox(white, 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/imgs/joined_kegiatan.png'),
              const Spacer(),
              Text(
                '200',
                style: semiBoldStyle(24, black),
              ),
              Text(
                'Kegiatan Yang diikuti',
                style: textStyle(10, grayCr),
              ),
              const Spacer(),
              Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                          mainController.pageGo(context, Profile());
                        },
                    child: Row(
                      children: [
                        Text(
                          'Lihat History',
                          style: semiBoldStyle(10, blueCr),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/imgs/next.png',
                          height: 15,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
        Container(
          width: 130,
          margin: const EdgeInsets.only(right: 8.0),
          padding: const EdgeInsets.all(16),
          decoration: roundedBox(white, 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/imgs/misses_kegiatan.png'),
              const Spacer(),
              Text(
                '100',
                style: semiBoldStyle(24, black),
              ),
              Text(
                'Kegiatan dilewatkan',
                style: textStyle(10, grayCr),
              ),
              const Spacer(),
              Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                          mainController.pageGo(context, Profile());
                        },
                    child: Row(
                      children: [
                        Text(
                          'Lihat History',
                          style: semiBoldStyle(10, blueCr),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/imgs/next.png',
                          height: 15,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
