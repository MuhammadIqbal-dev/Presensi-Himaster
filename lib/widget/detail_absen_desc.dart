import 'package:flutter/material.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widget/status_card.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({Key? key, required this.enable}) : super(key: key);
  final int enable;
  @override
  Widget build(BuildContext context) {
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
          runSpacing: 0.02* getHeight(context),
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
                    StatusCard(status: enable)
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
                      'https://meet.google.com/nda-uvqq-xwz',
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
                      width: 0.8*getWidth(context),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
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
