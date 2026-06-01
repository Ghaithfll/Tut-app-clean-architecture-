import 'package:clean_architecture/domain/models.dart';
import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/constants_manager.dart';
import 'package:clean_architecture/presentation/resources/font_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:clean_architecture/presentation/resources/text_styles_manager.dart';
import 'package:clean_architecture/presentation/resources/theme_manager.dart';
import 'package:clean_architecture/presentation/resources/values_manager.dart';
import 'package:clean_architecture/presentation/screens/onBoarding/viewModel/onBoardingViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/routes_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  PageController _pageController = PageController();
  void _bindWithViewModel() {
    // link the VM
    _viewModel.start();
  }

  @override
  void initState() {
    _bindWithViewModel(); // or just _viewmodel.start(), but always link VM before super.initState to get the data in time
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _viewModel.OutputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Scaffold(
        body: Center(
          child: Text("Error Occured"),
        ),
      );
    }
    else 
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
        itemCount: sliderViewObject.slidesNumber,
        onPageChanged: (index) {
          _viewModel.OnPageChanged(index);
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(sliderObject: sliderViewObject.sliderObject);
        },
      )),
      bottomSheet: _getBottomSheetWidget(sliderViewObject),
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

  Widget _getProperCircle(int index, int current_index) {
    if (index == current_index) {
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

  void NavigateToNextPage() {
    Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
  }

  GestureTapCallback? _onRightArrowPressed() {
    _pageController.animateToPage(_viewModel.getNextPageIndex(),
        duration:
            Duration(milliseconds: ConstantsManager.pageAnimationDuration),
        curve: Curves.linear);
  }

  GestureTapCallback? _onLeftArrowPressed() {
    _pageController.animateToPage(_viewModel.getPreviousPageIndex(),
        duration:
            Duration(milliseconds: ConstantsManager.pageAnimationDuration),
        curve: Curves.linear);
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
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
                        NavigateToNextPage();// skip button
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
                        for (int i = 0; i < sliderViewObject.slidesNumber; i++)
                          _getProperCircle(i, sliderViewObject.currentIndex),
                      ],
                    ),
                    _getSvgButton(
                        ImagesManager.rightArrowIc, _onRightArrowPressed),
                  ],
                ))
          ],
        ));
  }
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
