import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/font_manager.dart';
import 'package:clean_architecture/presentation/resources/text_styles_manager.dart';
import 'package:clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor:
        ColorManager.lightPrimary, // ripple effect , maybe the hover effect

    // card colors
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),//    something like the shadow height/length
    // app bar
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize
          .s4, // something related to the place/thickness of the appBar shadow
      titleTextStyle: getSemiBoldFontStyle(
          color: ColorManager.white, fontSize: AppSize.s16),
    ),
    // button
    buttonTheme: ButtonThemeData(
        buttonColor: ColorManager.primary,
        disabledColor: ColorManager.grey1,
        shape: StadiumBorder(),
        splashColor: ColorManager.lightPrimary),
    // elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle:
          getRegularFontStyle(color: ColorManager.white, fontSize: AppSize.s18),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)),
      backgroundColor: ColorManager.primary,
    )),
    // txt theme
    textTheme: TextTheme(
      headlineLarge: getSemiBoldFontStyle(
          color: ColorManager.darkGrey, fontSize: FontSizeManager.s16),
      headlineMedium: getMediumFontStyle(
          color: ColorManager.grey, fontSize: FontSizeManager.s14),
      headlineSmall: getRegularFontStyle(
          color: ColorManager.grey, fontSize: FontSizeManager.s14),// these 3 are smt like h1,h2 in html
    ),
    // input theme (text fields)
    //
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      labelStyle: getMediumFontStyle(
          color: ColorManager.grey, fontSize: FontSizeManager.s14),
      hintStyle: getRegularFontStyle(
          color: ColorManager.grey, fontSize: FontSizeManager.s14),
      errorStyle: getRegularFontStyle(
          color: ColorManager.error, fontSize: FontSizeManager.s14),

      // border styles / enabled,disabled,focused,error border
      // all are the same theme BUT only the Color differs
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        borderSide: BorderSide(
            color: ColorManager.grey2,
            width: AppSize.s1_5), // width is border thickness
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        borderSide: BorderSide(
            color: ColorManager.error,
            width: AppSize.s1_5), // width is border thickness
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        borderSide: BorderSide(
            color: ColorManager.blue,
            width: AppSize.s1_5), // width is border thickness
      ),
    ),
  );
}
