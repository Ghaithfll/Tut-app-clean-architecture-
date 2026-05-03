import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/font_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:clean_architecture/presentation/resources/text_styles_manager.dart';
import 'package:clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _title_num = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar: AppBar(
          title: Text("~ OnBoarding ~"),
        ),
      */
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppStrings.onBoardingTitles[_title_num],
          style: getBoldFontStyle(
              color: ColorManager.grey, fontSize: FontSizeManager.s18),
        ),
        SizedBox(
          height: AppSize.s8,
        ),
        Text(
          AppStrings.onBoardingSubTitles[_title_num],
          textAlign: TextAlign.center,
          style: getSemiBoldFontStyle(
            color: ColorManager.darkGrey,
            fontSize: FontSizeManager.s12,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: Image.asset(AssetsManager.splash_logo),
        )
      ],
    )));
  }
}
