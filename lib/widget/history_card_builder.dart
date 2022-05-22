import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controller/main_controller.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widget/history_card.dart';
import 'package:presensi_himaster/widget/status_card.dart';

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          mainController.droppedDown.add(false);
          return Obx(
            () => HistoryCard(
              status: mainController.droppedDown[index], idx: index, enable: enable[index],
            ),
          );
        });
  }
}
