import 'package:flutter/material.dart';

Color startCr = const Color(0xFF5AC3FF);
Color midCr = const Color(0xFF4DAEED);
Color darkBlueCr = const Color(0xFF2877BD);
Color blueCr = const Color(0xFF56CCF2);
Color redCr = const Color(0xFFEB5757);
Color lightRedCr = const Color(0xFFFFE3E3);
Color lightGrayCr = const Color(0xFFBDBDBD);
Color grayCr = const Color(0xFF828282);
Color darkGreenCr = const Color(0xFF27AE60);
Color greenCr = const Color(0xFF42D07D);
Color lightGreenCr = const Color(0xFFE3FFEF);
Color yellowCr = const Color(0xFFEDDA30);
Color lightYellowCr = const Color(0xFFFFFFF1);
Color white = const Color(0xFFFFFFFF);
Color black = const Color(0xFF000000);

TextStyle boldStyle(double size, Color colors) {
  return TextStyle(fontSize: size, color: colors, fontWeight: FontWeight.bold);
}

TextStyle semiBoldStyle(double size, Color colors) {
  return TextStyle(fontSize: size, color: colors, fontWeight: FontWeight.w600);
}

TextStyle textStyle(double size, Color colors) {
  return TextStyle(fontSize: size, color: colors);
}

ButtonStyle textBox = TextButton.styleFrom(
    primary: blueCr,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));

ButtonStyle roundedButton(Color colors) {
  return OutlinedButton.styleFrom(
      primary: white,
      shadowColor: Colors.transparent,
      backgroundColor: colors,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
}

ButtonStyle roundedOutButton(Color colors, Color outColors) {
  return OutlinedButton.styleFrom(
      primary: white,
      shadowColor: Colors.transparent,
      backgroundColor: colors,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      side: BorderSide(color: outColors, width: 2));
}


BoxDecoration roundedBox(Color colors, double radius) {
  return BoxDecoration(
    color: colors,
    borderRadius: BorderRadius.circular(radius),
  );
}

BoxDecoration roundedShadowBox(Color colors, double radius) {
  return BoxDecoration(
      color: colors,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.22),
          spreadRadius: 1,
          blurRadius: 8,
        )
      ]);
}
BoxDecoration roundedTopShadowBox(Color colors, double radius) {
  return BoxDecoration(
      color: colors,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(radius), topRight: Radius.circular(radius)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.22),
          spreadRadius: 1,
          blurRadius: 8,
        )
      ]);
}

BoxDecoration roundedGradBox(double radius) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.1, 0.5, 0.9],
          colors: [startCr, midCr, darkBlueCr]));
}
OutlineInputBorder blueBorder = OutlineInputBorder(
    borderSide: BorderSide(color: blueCr),
    borderRadius: BorderRadius.circular(8.0));

OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: blueCr),
    borderRadius: BorderRadius.circular(8.0));


double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
