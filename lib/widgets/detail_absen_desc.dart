import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:presensi_himaster/controllers/main_controller.dart';
import 'package:presensi_himaster/models/list_absen.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/status_card.dart';

class DetailInfo extends StatelessWidget {
  DetailInfo({Key? key,  required this.data})
      : super(key: key);
  final Code data;

  final MainController _mainController = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    String date = DateFormat('d MMM y').format(data.start);
    String start = DateFormat.Hm().format(data.start);
    String end = DateFormat.Hm().format(data.end);
    String formattedTime = "$start - $end Wib";
    

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 0.6 * getHeight(context),
        ),
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          runSpacing: 0.02 * getHeight(context),
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/imgs/info_icon.png',
                  color: grayCr,
                ),
                SizedBox(
                  width: 0.03 * getWidth(context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status Kehadiran:',
                      style: textStyle(10, lightGrayCr),
                    ),
                    Obx((() {
                      return StatusCard(status: _mainController.statusMap[data.id]);
                    }))
                    
                  ],
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/imgs/calender_icon.png',
                  color: grayCr,
                ),
                SizedBox(
                  width: 0.03 * getWidth(context),
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
                  width: 0.03 * getWidth(context),
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
                  'assets/imgs/time_icon.png',
                  color: grayCr,
                ),
                SizedBox(
                  width: 0.03 * getWidth(context),
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
                  width: 0.03 * getWidth(context),
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
            Row(
              children: [
                Image.asset(
                  'assets/imgs/embed_icon.png',
                  color: grayCr,
                ),
                SizedBox(
                  width: 0.03 * getWidth(context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Links',
                      style: textStyle(10, lightGrayCr),
                    ),
                    Text(
                      data.link!,
                      style: textStyle(12, grayCr),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/imgs/desc_icon.png',
                  color: grayCr,
                ),
                SizedBox(
                  width: 0.03 * getWidth(context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: textStyle(10, lightGrayCr),
                    ),
                    SizedBox(
                      width: 0.8 * getWidth(context),
                      child: Text(
                        data.desc!,
                        maxLines: 6,
                        textAlign: TextAlign.justify,
                        style: textStyle(12, grayCr),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
