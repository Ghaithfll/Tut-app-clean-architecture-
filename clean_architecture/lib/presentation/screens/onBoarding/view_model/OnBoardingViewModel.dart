import 'dart:async';

import 'package:clean_architecture/presentation/base/baseViewModel.dart';
import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

List<String> onBoardingLogos = List.from(
    AssetsManager.onBoardingLogos); // copy the content of the Logos list
List<String> onBoardingTitles = List.from(AppStrings.onBoardingTitles);
List<String> onBoardingSubTitles = List.from(AppStrings.onBoardingSubTitles);

abstract class OnboardingviewmodelInputs {
  // the methods u call from the view
// nextPage, prevPage,
  Sink get inputAllDataThatViewNeeds;
  int getPrevPageIndex(int index);
  int getNextPageIndex(int index);
}

abstract class OnboardingviewmodelOutputs {
  // VM => V
  Stream get outputStream;
}

/*  Data to be sent to V
      Titles/SubTitles & logos Lists
*/
class Onboardingviewmodel
    implements
        Baseviewmodel,
        OnboardingviewmodelInputs,
        OnboardingviewmodelOutputs {
  int current_index = 0;
  StreamController<AllDataThatViewNeeds> _streamController = StreamController();
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // current index,logos list,
    // TODO: implement start
    SendDataToView();
    debugPrint("Data sent from onBoarding VM => V");
  }

  @override
  // TODO: implement OnBoardingListsobject
  Stream get outputStream => _streamController.stream
      .map((AllDataThatViewNeeds) => AllDataThatViewNeeds);

  @override
  // TODO: implement inputAllDataThatViewNeeds
  Sink get inputAllDataThatViewNeeds => _streamController.sink;

  void SendDataToView() {
    _streamController.sink.add(AllDataThatViewNeeds(
        current_index,
        OnBoardingLists(
            onBoardingLogos, onBoardingSubTitles, onBoardingTitles)));
  }

  @override
  // TODO: implement getPrevPageIndex
  int getPrevPageIndex(int index) {
    int newIndex = index - 1;
    if (newIndex < 0) {
      newIndex = 0;
    }
    debugPrint("current index $index prev index $newIndex");
    current_index = newIndex;
    SendDataToView();
    return newIndex;
  }

  @override
  int getNextPageIndex(int index) {
    // TODO: implement getNectPageIndex
    int newIndex = index + 1;
    if (newIndex >= onBoardingLogos.length) {
      newIndex = onBoardingLogos.length - 1;
    }
    debugPrint("logos list length ${onBoardingLogos.length}");
    debugPrint("current index $index next index $newIndex");
    current_index = newIndex;
    SendDataToView();
    return newIndex;
  }
}

class OnBoardingLists {
  List<String> logos;
  List<String> titles;
  List<String> sub_titles;
  OnBoardingLists(this.logos, this.sub_titles, this.titles);
}

class AllDataThatViewNeeds {
  OnBoardingLists lists;
  int current_index;
  AllDataThatViewNeeds(this.current_index, this.lists);
}
