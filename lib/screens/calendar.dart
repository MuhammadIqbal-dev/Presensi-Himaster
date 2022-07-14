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
        child: Column(
          children: [
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2019, 10, 16),
              lastDay: DateTime.utc(2030, 12, 30),
              startingDayOfWeek: StartingDayOfWeek.monday,
              weekendDays: [DateTime.sunday, 6],
              daysOfWeekHeight: 60,
              rowHeight: 60,
              headerStyle: HeaderStyle(
                  leftChevronIcon: Icon(
                    Icons.chevron_left_rounded,
                    color: white,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right_rounded,
                    color: white,
                  ),
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: textStyle(24, white)),
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: semiBoldStyle(14, redCr),
                  weekdayStyle: textStyle(14, white)),
              calendarStyle: CalendarStyle(
                  weekendTextStyle: semiBoldStyle(14, redCr),
                  defaultTextStyle: textStyle(14, white),
                  todayDecoration: BoxDecoration(
                      color: lightGreenCr, shape: BoxShape.circle),
                  todayTextStyle: semiBoldStyle(14, black)),
            ),
            const Spacer(),
            SizedBox(
              height: 42,
              width: 0.7 * getWidth(context),
              child: OutlinedButton(
                  style: roundedOutButton(Colors.transparent, white),
                  onPressed: (() {}),
                  child: Text(
                    '!! Under Development !!',
                    style: semiBoldStyle(14, white),
                  )),
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
