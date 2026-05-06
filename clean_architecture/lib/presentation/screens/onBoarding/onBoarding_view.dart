import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/constants_manager.dart';
import 'package:clean_architecture/presentation/resources/font_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:clean_architecture/presentation/resources/text_styles_manager.dart';
import 'package:clean_architecture/presentation/resources/theme_manager.dart';
import 'package:clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/routes_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _page_index = 0;
  PageController _pageController = PageController();
  List<SliderObject> _pagesList = [
    SliderObject(ImagesManager.onBoarding_logo1,
        AppStrings.onBoardingSubTitles[0], AppStrings.onBoardingTitles[0]),
    SliderObject(ImagesManager.onBoarding_logo2,
        AppStrings.onBoardingSubTitles[1], AppStrings.onBoardingTitles[1]),
    SliderObject(ImagesManager.onBoarding_logo3,
        AppStrings.onBoardingSubTitles[2], AppStrings.onBoardingTitles[2]),
    SliderObject(ImagesManager.onBoarding_logo4,
        AppStrings.onBoardingSubTitles[3], AppStrings.onBoardingTitles[3])
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        surfaceTintColor: ColorManager.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness:
                Brightness.light), // status bar icons color(battery,wifi,...)
      ),
      body: Center(
          child: PageView.builder(
        controller: _pageController,
        itemCount: _pagesList.length,
        onPageChanged: (index) {
          setState(() {
            _page_index = index;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(sliderObject: _pagesList[index]);
        },
      )),
      bottomSheet: Container(
          color: ColorManager.white,
          // height: AppSize.s140,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(AppPadding.p12),
                    child: TextButton(
                        onPressed: () {
                          NavigateToNextPage();
                        },
                        child: Text(
                          AppStrings.skip,
                          style: getRegularFontStyle(
                              fontSize: FontSizeManager.s14,
                              color: ColorManager.primary),
                        )),
                  )),
              Container(
                  color: ColorManager.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _getSvgButton(
                          ImagesManager.leftArrowIc, _onLeftArrowPressed),
                      Row(
                        children: [
                          for (int i = 0; i < _pagesList.length; i++)
                            _getProperCircle(i),
                        ],
                      ),
                      _getSvgButton(
                          ImagesManager.rightArrowIc, _onRightArrowPressed),
                    ],
                  ))
            ],
          )),
    );
  }

  Widget _getSvgButton(String assetImage, GestureTapCallback? OnTap) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p20),
      child: GestureDetector(
        child: Container(
            //color: ColorManager.blue,
            width: AppSize.s60,
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(assetImage),
            )),
        onTap: () {
          if (OnTap != null) {
            print("not null method ###########");
            OnTap();
          } else
            print("null function ############");
        },
      ),
    );
  }

  Widget _getProperCircle(int index) {
    if (index == _page_index) {
      return Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: SvgPicture.asset(
            ImagesManager.hollowCircleIc,
          ));
    } else
      return Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: SvgPicture.asset(ImagesManager.solidCircleIc));
  }

  int _getPreviousPageIndex() {
    int prevIndex = _page_index - 1;
    if (prevIndex < 0) {
      prevIndex = 0;
    }
    print("prev index $prevIndex");
    return prevIndex;
  }

  int _getNextPageIndex() {
    int nextIndex = _page_index + 1;
    if (nextIndex >= _pagesList.length) {
      NavigateToNextPage();
      nextIndex = _pagesList.length - 1;
    }
    print("next index $nextIndex");
    return nextIndex;
  }

  void NavigateToNextPage() {
    Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
  }

  GestureTapCallback? _onRightArrowPressed() {
    _pageController.animateToPage(_getNextPageIndex(),
        duration:
            Duration(milliseconds: ConstantsManager.pageAnimationDuration),
        curve: Curves.linear);
  }

  GestureTapCallback? _onLeftArrowPressed() {
    _pageController.animateToPage(_getPreviousPageIndex(),
        duration:
            Duration(milliseconds: ConstantsManager.pageAnimationDuration),
        curve: Curves.linear);
  }
}

class SliderObject {
  String title;
  String subTitle;
  String assetImage;
  SliderObject(this.assetImage, this.subTitle, this.title);
}

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key, required this.sliderObject});
  SliderObject sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Padding(
            padding: EdgeInsets.all(AppPadding.p8),
            child: Text(
              sliderObject.subTitle,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            )),
        SizedBox(
          height: AppSize.s40,
        ),
        Padding(
            padding: EdgeInsets.all(AppPadding.p8),
            child: SvgPicture.asset(
              sliderObject.assetImage,
              //width: MediaQuery.sizeOf(context).width * 0.8,
            )),
      ],
    );
  }
}
