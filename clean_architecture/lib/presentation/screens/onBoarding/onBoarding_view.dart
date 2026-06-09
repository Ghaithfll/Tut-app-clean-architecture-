import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/constants_manager.dart';
import 'package:clean_architecture/presentation/resources/font_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:clean_architecture/presentation/resources/text_styles_manager.dart';
import 'package:clean_architecture/presentation/resources/values_manager.dart';
import 'package:clean_architecture/presentation/screens/onBoarding/view_model/OnBoardingViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

//       we need  curentIndex,
class _OnboardingViewState extends State<OnboardingView> {
  int _current_index = 0; //            currrent index
  List<String> onBoardingLogos = []; // u must get it from the VM
  List<String> onBoardingTitles = [];
  List<String> onBoardingSubTitles = [];
  PageController _pageController = PageController();
  Onboardingviewmodel _view_model = Onboardingviewmodel();
  @override
  void initState() {
    // TODO: implement initState
    _view_model.start();
    debugPrint("data received from onBoarding VM");
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _view_model.outputStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // if snapshot.data == null
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        debugPrint(
            "before extracting data, ${snapshot.data.lists.titles} / ${snapshot.data.current_index}");
        ExtractDataReceivedFromVM(
            snapshot.data); // maybe we can make it Future? to pause execution
        debugPrint("data extraction finished");
        return Scaffold(
          body: BodyContent(snapshot.data),
          bottomSheet: BottomSheetWidget(),
        );
      },
    );
  }

  Widget BottomSheetWidget() {
    return Container(
      height: AppSize.s160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.p12),
                  child: Text(
                    AppStrings.skip,
                    style: getBoldFontStyle(
                        color: ColorManager.primary,
                        fontSize: FontSizeManager.s16),
                  ),
                )),
          ),
          Container(
              height: AppSize.s60,
              color: ColorManager.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getSvgButton(AssetsManager.leftArrowIc, leftArrowOnPressed),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0;
                          i < onBoardingLogos.length;
                          i++) // should be list.length
                        Padding(
                            padding: EdgeInsets.all(AppPadding.p8),
                            child: getSuitableCircle(i,
                                _current_index)), // should be the real current index
                    ],
                  ),
                  getSvgButton(AssetsManager.rightArrowIc, rightArrowOnPressed),
                  // 2 arrow svg buttons , svg circles
                ],
              ))
        ],
      ),
    );
  }

  Widget getSuitableCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(AssetsManager.solidCircleIc);
    }
    return SvgPicture.asset(AssetsManager.hollowCircleIc);
  }

  Widget getSvgButton(String svgImagePath, GestureTapCallback? onTap) {
    return GestureDetector(
      onTap: () {
        if (onTap == null) {
          debugPrint("null function");
        } else {
          onTap();
        }
      },
      child: Padding(
          padding: EdgeInsets.all(AppPadding.p18),
          child: SizedBox(
              height: AppSize.s18,
              width: AppSize.s18,
              child: SvgPicture.asset(svgImagePath))),
    );
  }

  BodyContent(AllDataThatViewNeeds data) {
    return PageView.builder(
      controller: _pageController,
      itemCount: onBoardingLogos.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s200,
            ),
            Text(
              onBoardingTitles[_current_index], // current index
              style: getBoldFontStyle(
                  color: ColorManager.grey, fontSize: FontSizeManager.s18),
            ),
            SizedBox(
              height: AppSize.s12,
            ),
            Text(
              onBoardingSubTitles[_current_index], // current index
              textAlign: TextAlign.center,
              style: getSemiBoldFontStyle(
                color: ColorManager.darkGrey,
                fontSize: FontSizeManager.s12,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                  AppPadding.p8), //          must become onBoardingLogos
              child: SvgPicture.asset(onBoardingLogos[_current_index]),
            )
          ],
        );
      },
    );
  }

  void ExtractDataReceivedFromVM(AllDataThatViewNeeds data) {
    _current_index = data.current_index;
    if (onBoardingLogos.length == 0) {
      onBoardingTitles = List.from(data.lists.titles);
      onBoardingSubTitles = List.from(data.lists.sub_titles);
      onBoardingLogos = List.from(data.lists.logos);
    }

    debugPrint("data extracted successfully!!");
    debugPrint("data ${data.current_index} / ${data.lists.logos.length}");
  }

  GestureTapCallback? leftArrowOnPressed() {
    _pageController.animateToPage(_view_model.getPrevPageIndex(_current_index),
        duration:
            Duration(milliseconds: ConstantsManager.page_animation_duration),
        curve: Curves.linear);
  }

  GestureTapCallback? rightArrowOnPressed() {
    _pageController.animateToPage(_view_model.getNextPageIndex(_current_index),
        duration:
            Duration(milliseconds: ConstantsManager.page_animation_duration),
        curve: Curves.linear);
  }
}
