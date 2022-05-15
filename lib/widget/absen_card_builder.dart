import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widget/status_card.dart';
class AbsenCardBuilder extends StatelessWidget {
  final List items = [
    'It club ke 1',
    'It club ke 2',
    'It club ke 3',
    'It club ke 4',
  ];
  final List enable = [1, 2, 3, 2];

  AbsenCardBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: 192,
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.only(right: 8.0),
            decoration: roundedBox(white, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusCard(
                  status: index,
                ),
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
                    Text(
                      items[index],
                      style: semiBoldStyle(12, grayCr),
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
                      '08:00 - 12:00 WIB',
                      style: boldStyle(12, black),
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
                    Text(
                      'Lab Siskom A',
                      style: semiBoldStyle(12, grayCr),
                    )
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 4,
                    child: Row(
                  children: [
                    Text(
                      'Absen Sekarang',
                      style: semiBoldStyle(10, blueCr),
                    ),
                    const Spacer(),
                    Image.asset('assets/imgs/next.png', height: 32,)
                  ],
                ))
              ],
            ),
          );
        });
  }
}
