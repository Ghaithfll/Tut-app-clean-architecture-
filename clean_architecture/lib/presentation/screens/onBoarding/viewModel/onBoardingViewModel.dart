import 'dart:async';

import 'package:clean_architecture/domain/models.dart';
import 'package:clean_architecture/presentation/base/baseViewModel.dart';
import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';

class OnBoardingViewModel
    implements
        BaseViewModel,
        OnBoardingViewModelInputs,
        OnBoardingViewModelOutputs {
  int _current_index = 0;
  late List<SliderObject> _pagesList;
  // stream output
  final StreamController _streamController = StreamController<
      SliderViewObject>(); // gonna hold the data back to view(we'r sending SliderViewObject to the view so its the type of the controller)
  // gonna need inputs/outputs versions
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _pagesList = _getSliderData();
    _postDataToView();
  }

  @override
  void OnPageChanged(int newIndex) {
    _current_index = newIndex;
    _postDataToView();
  }

  @override
  void NavigateToNextPage() {
    // TODO: implement NavigateToNextPage
  }

  @override
  // Onboarding viewModel inputs
  Sink get inputSliderViewObject => _streamController
      .sink; // holds whatever the view sends (a dynamic value, in our case it should be a )

  @override
  // Onboarding viewModel outputs
  Stream get OutputSliderViewObject => _streamController.stream.map(
        (sliderViewObject) => sliderViewObject,
      ); // .map() only changes the data format(cuz stream holds dynamic, and we may want to convert the data format sent back to view)

  List<SliderObject> _getSliderData() {
    return [
      SliderObject(ImagesManager.onBoarding_logo1,
          AppStrings.onBoardingSubTitles[0], AppStrings.onBoardingTitles[0]),
      SliderObject(ImagesManager.onBoarding_logo2,
          AppStrings.onBoardingSubTitles[1], AppStrings.onBoardingTitles[1]),
      SliderObject(ImagesManager.onBoarding_logo3,
          AppStrings.onBoardingSubTitles[2], AppStrings.onBoardingTitles[2]),
      SliderObject(ImagesManager.onBoarding_logo4,
          AppStrings.onBoardingSubTitles[3], AppStrings.onBoardingTitles[3])
    ];
  }

  void _postDataToView() {
    inputSliderViewObject.add(
        // we put a slider viewObject as an input for the StreamController cuz this is its type, and the Sink is the input point
        SliderViewObject(
            _current_index, _pagesList[_current_index], _pagesList.length));
  }

  @override
  int getPreviousPageIndex() {
    int prevIndex = _current_index - 1;
    if (prevIndex < 0) {
      prevIndex = 0;
    }

    return prevIndex;
  }

  @override
  int getNextPageIndex() {
    int nextIndex = _current_index + 1;
    print("prev $_current_index");
    if (nextIndex >= _pagesList.length) {
      nextIndex = _pagesList.length - 1;
    }
    print("next $nextIndex , List Length ${_pagesList.length}");
    return nextIndex;
  }
}

abstract class OnBoardingViewModelInputs {
  // methods the 'view' will call
  void OnPageChanged(int newIndex);
  void NavigateToNextPage();
  int getPreviousPageIndex();
  int getNextPageIndex();
  // stream controller inputs
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  // send back the data to the view (u need to refresh the related widgets => state management)

  // stream controller outputs
  Stream get OutputSliderViewObject;
}

class SliderViewObject {
  // everything the view needs to have when its built
  // the data sent back from viewmodel => view
  SliderObject sliderObject;
  int slidesNumber; // list.length
  int currentIndex;
  SliderViewObject(this.currentIndex, this.sliderObject, this.slidesNumber);
}




// each streamController has 'Sink' input and 'Stream' output