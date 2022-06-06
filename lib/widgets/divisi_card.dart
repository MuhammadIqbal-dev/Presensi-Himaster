import 'package:flutter/material.dart';
import 'package:presensi_himaster/theme.dart';

class DivisiCard extends StatelessWidget {
  const DivisiCard({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
   return Container(
        height: 32,
        width: 0.22 * getWidth(context),
        decoration: roundedBox(lightGreenCr, 6),
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: semiBoldStyle(8, greenCr),
          textAlign: TextAlign.center,
        ),
      );
  }
}