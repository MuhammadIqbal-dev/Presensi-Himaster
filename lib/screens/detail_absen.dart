import 'package:flutter/material.dart';
import 'package:presensi_himaster/models/list_absen.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/detail_absen_button_card.dart';
import 'package:presensi_himaster/widgets/detail_absen_desc.dart';

class DetailAbsen extends StatelessWidget {
  const DetailAbsen({Key? key, required this.history, required this.dataCode}) : super(key: key);
  final List<History> history;
  final Code dataCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text(
          'Detail Kegiatan',
          style: semiBoldStyle(13, grayCr),
        ),
        iconTheme: IconThemeData(color: grayCr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: DetailInfo( data: dataCode,),
            )),
          Flexible(
            flex: 3,
            child: AbsenButtonCard(dataCode: dataCode,))
        ],
      ),
    );
  }
}
