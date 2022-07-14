import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/models/list_absen.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/history_card.dart';

class HistoryCardBuilder extends StatelessWidget {
  final mainController = Get.find<MainController>();



  HistoryCardBuilder({Key? key}) : super(key: key);
  bool isThereData = false;

  @override
  Widget build(BuildContext context) {
    List<Event> dataAbsen = mainController.userAbsen.value.user!.event;
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
    for (var element in dataAbsen) {
      if (element.code.isNotEmpty) {
        isThereData = true;
        break;
      }
    }
  
    if (isThereData) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: maps.length,
          itemBuilder: (context, index) {
            mainController.droppedDown.add(false);
            late Code code;
            for (var element in dataAbsen) {
              for (Code data in element.code) {
                if (data.id == keys[index]) {
                  mainController.isThereData.value = true;
                  code = data;
                  break;
                }
              }
            }
            if (mainController.isThereData.value) {
              return Obx(
              () => HistoryCard(
                status: mainController.droppedDown[index],
                idx: index,
                
                keys: keys[index],
                data: code,
                values: values[index],
              ),
            );
            }else{
              return Container();
            }
            
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
                'Tidak ada History Absen',
                style: semiBoldStyle(12, grayCr),
              )
            ],
          ),
        ],
      );
    }
  }
}
