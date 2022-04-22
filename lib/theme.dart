import 'package:flutter/material.dart';


Color startCr = const Color(0xFF5AC3FF);
Color midCr = const Color(0xFF4DAEED);
Color blueCr = const Color(0xFF56CCF2);
Color redCr = const Color(0xFFEB5757);
Color grayCr = const Color(0xFF828282);
Color darkBlueCr = const Color(0xFF2877BD);
Color white = const Color(0xFFFFFFFF);
Color black = const Color(0xFF000000);



TextStyle titleStyle = TextStyle(fontSize: 14.0, color: blueCr, fontWeight: FontWeight.w600);
TextStyle semiBoldStyle = TextStyle(fontSize: 20.0, color: black, fontWeight: FontWeight.w600);
TextStyle descStyle = TextStyle(fontSize: 12.0, color: grayCr);

ButtonStyle roundedBox = OutlinedButton.styleFrom(
    primary: white,
    shadowColor: Colors.transparent,
    backgroundColor: blueCr,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)));

ButtonStyle textBox = TextButton.styleFrom(
    primary: blueCr,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)));

OutlineInputBorder blueBorder = OutlineInputBorder(
    borderSide: BorderSide(color: blueCr),
    borderRadius: BorderRadius.circular(8.0));

OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: blueCr),
    borderRadius: BorderRadius.circular(8.0));

class ThemeConfig{
  double getWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  double getHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
}