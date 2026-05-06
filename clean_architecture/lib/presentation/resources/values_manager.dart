class AppMargin{
  static const double m8 = 8;
  static const double m12 = 12;
  static const double m14 = 14;
  static const double m16 = 16;
  static const double m18 = 18;
  static const double m20 = 20;
}

class AppPadding{
  static const double p8 = 8;
  static const double p12 = 12;
  static const double p14 = 14;
  static const double p16 = 16;
  static const double p18 = 18;
  static const double p20 = 20;
  static const double p30 = 30;
}

class AppSize{//          any value u need across the app, (corner radius,elevation,animation duration,animation speed,...), and u can create classes as u need one for each purpose (Single purpose principle SOLID) 
  static const double s1_5 = 1.5;
  static const double s4 = 4;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s14 = 14;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;
   static const double s40 = 40;
   static const double s60 = 60;
   static const double s80 = 80;
   
   static const double s100 = 100;
   
   static const double s120 = 120;
   
   static const double s140 = 140;
}
/*
  these classes are used to avoid hard-written values inside widgets, so whenever u need a value for something
  margin/padding/animation duration/border radius => just put them all in some class
*/