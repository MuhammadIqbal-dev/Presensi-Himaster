import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: startCr,
        title: Text(
          'Semua Jadwal',
          style: semiBoldStyle(13, white),
        ),
        iconTheme: IconThemeData(color: white),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: gradBox(),
        child: TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2019, 10, 16),
            lastDay: DateTime.utc(2030, 12, 30),
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false
              
            ),
            ),
      ),
    );
  }
}
