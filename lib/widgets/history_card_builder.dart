import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/models/list_absen.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/history_card.dart';
import 'package:presensi_himaster/widgets/status_card.dart';

class HistoryCardBuilder extends StatelessWidget {
  final mainController = Get.find<MainController>();
  final List items = [
    'It club ke 1',
    'It club ke 2',
    'It club ke 3',
    'It club ke 4',
    'It club ke 5',
  ];
  final List enable = [
    1,
    2,
    2,
    2,
    1,
  ];

  HistoryCardBuilder({Key? key}) : super(key: key);
  bool isThereData = false;

  @override
  Widget build(BuildContext context) {
    List<Event> dataAbsen = mainController.userAbsen.value.user!.event;
    List<History> dataHistory = mainController.userAbsen.value.history!;
    var maps = {};
    var keys = [];
    var values = [];
    mainController.statusMap.forEach((key, value) {
      if (value == 1 || value == 2) {
        maps[key] = value;
        keys.add(key);
        values.add(value);
      }
    });
    for (var element in mainController.userAbsen.value.user!.event) {
      if (element.code.length >= 1) {
        isThereData = true;
        break;
      }
    }
    print(keys);
    print(values);
    print(maps.length);
    if (isThereData) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: maps.length,
          itemBuilder: (context, index) {
            mainController.droppedDown.add(false);
            print('aaa');
            print(keys[index]);
            return Obx(
              () => HistoryCard(
                status: mainController.droppedDown[index],
                idx: index,
                enable: enable[index],
                keys: keys[index],
                values: values[index],
              ),
            );
          });
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/imgs/no-resultss.png',
                  height: 200,
                ),
                Text(
                  'Tidak ada History Absen',
                  style: semiBoldStyle(12, grayCr),
                )
              ],
            ),
          ),
        ],
      );
    }
  }
}
