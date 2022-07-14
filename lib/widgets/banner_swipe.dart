import 'dart:async';

import 'package:flutter/material.dart';
import 'package:presensi_himaster/screens/login.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/on_board_widget.dart';

import '../models/slide_model.dart';

class BannerSwap extends StatefulWidget {
  const BannerSwap({Key? key}) : super(key: key);

  @override
  State<BannerSwap> createState() => _BannerSwapState();
}

class _BannerSwapState extends State<BannerSwap> {
  List<SliderModel> slides = [];
  int currentIndex = 0;
  late PageController _controller;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
    _timer = Timer.periodic(const Duration(seconds: 8), (Timer timer) {
    if (currentIndex < 2) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }

    _controller.animateToPage(
      currentIndex,
      duration: Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            onPageChanged: (v) {
              setState(() {
                currentIndex = v;
              });
            },
            itemCount: slides.length,
            itemBuilder: (context, index) {
              return Image(
                image: AssetImage('assets/imgs/first_img.png'),
              );
            }),
        Positioned(
          right: 15,
          bottom: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                slides.length, (index) => buildDot(index, context)),
          ),
        ),
      ],
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      height: 5,
      width: currentIndex == index ? 8 : 5,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: blueCr),
      duration: const Duration(milliseconds: 200),
    );
  }
}
