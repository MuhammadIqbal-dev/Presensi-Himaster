
import 'package:flutter/material.dart';
import 'package:presensi_himaster/theme.dart';

class CategoryBuilder extends StatelessWidget{
  final List items = [
    'Semua',
    'Keilmuan',
    'Keilmuan',
    'Keilmuan',
    'Keilmuan',
    'Kaderisasi'
  ];
  final List enable = [
    true,
    false,
    false,
    false,
    false,
    false,
  ];

  CategoryBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: enable[index]
                          ? roundedBox(blueCr, 50)
                          : roundedBox(Colors.transparent, 50),
                      child: Text(
                        items[index],
                        style: enable[index]? semiBoldStyle(12, white): textStyle(12,grayCr),
                      ),
                    );
                  });
  }
}