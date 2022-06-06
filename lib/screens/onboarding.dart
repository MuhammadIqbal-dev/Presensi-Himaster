import 'package:flutter/material.dart';
import 'package:presensi_himaster/screens/login.dart';
import 'package:presensi_himaster/theme.dart';
import 'package:presensi_himaster/widgets/on_board_widget.dart';

import '../models/slide_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<SliderModel> slides = [];
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                onPageChanged: (v) {
                  setState(() {
                    currentIndex = v;
                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  return OnBoardWidget(
                    image: slides[index].getImage(),
                    title: slides[index].getTitle(),
                    desc: slides[index].getDescription(),
                  );
                }),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  slides.length, (index) => buildDot(index, context)),
            ),
          ),
          Flexible(
              flex: 1,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 80),
                  curve: Curves.linear,
                  width: currentIndex != slides.length - 1
                      ? 0.28 * (MediaQuery.of(context).size.height)
                      : 0.40 * (MediaQuery.of(context).size.height),
                  height: 48.0,
                  child: currentIndex != slides.length - 1
                      ? TextButton(
                        style: textBox,
                          child: const Text('Selanjutnya'),
                          onPressed: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut);
                          })
                      : OutlinedButton(
                        style: roundedButton(blueCr),
                          onPressed: () {
                            if (currentIndex == slides.length - 1) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            }
                          },
                          child: const Text('Mulai Sekarang'))))
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      height: 10,
      width: currentIndex == index ? 18 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: darkBlueCr),
      duration: const Duration(milliseconds: 200),
    );
  }
}
