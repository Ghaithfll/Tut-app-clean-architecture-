import 'package:flutter/material.dart';

/*
these 3 classes let us control the sizes of titles,text fields and everything
related to the font weight/size across the whole application so the ui/ux become
more consistent
*/

class FontConstants{
  static const String fontFamily = "Montserrat"; //  
}

class FontWeightManager{

static const FontWeight light = FontWeight.w300;
static const FontWeight regular= FontWeight.w400;
static const FontWeight medium= FontWeight.w500;
static const FontWeight semiBold= FontWeight.w600;
static const FontWeight bold= FontWeight.w700;

}

class FontSizeManager{ //       to standardize the font sizes across the whole app 
  static const double s12 = 12;
  static const double s14 = 14;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;
  static const double s22 = 22;
}