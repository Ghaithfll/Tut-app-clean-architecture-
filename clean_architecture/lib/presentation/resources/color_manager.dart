import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = Color(0xffED972B);

  ///  take the hexa ED972B and add '0xff' before it so it becomes integer
  static const Color grey = Color(
      0xff525252); //       note that ff means 100% opacity, if u wanna change the opacity, just replace the ff with opacity hexa code u need
  static const Color lightGrey = Color(0xff737477);
  static const Color darkGrey = Color(0xff9E9E9E);
  static const Color blue = Colors.blue;

  static Color darkPrimary = const Color(0xffd17d11);
  static Color lightPrimary = const Color(
      0xCCd17d11); // color with 80% opacity (80% => CC after the 0x)
  static Color grey1 = const Color(0xff707070);
  static Color grey2 = const Color(0xff797979);
  static Color white = const Color(0xffFFFFFF);
  static Color error = const Color(0xffe61f34); // red color
}  

// all the colors are static so we can call them by the class name everywhere