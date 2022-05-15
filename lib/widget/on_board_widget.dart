import 'package:flutter/material.dart';
import 'package:presensi_himaster/theme.dart';

class OnBoardWidget extends StatelessWidget {
  const OnBoardWidget({Key? key, this.image, this.title, this.desc})
      : super(key: key);
  final String? image;
  final String? title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image(
          image: AssetImage(image!),
          width: 0.80 * getWidth(context),
          height: 0.55 * getHeight(context),
        ),
        const Spacer(),
        Text(
          title!,
          style: semiBoldStyle(14, blueCr),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Text(
            desc!,
            style: textStyle(12, grayCr),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
