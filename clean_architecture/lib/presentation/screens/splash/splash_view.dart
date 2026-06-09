import 'dart:async';

import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startTimer()  {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      print(timer.tick);
      _GoNext();
      timer.cancel();
    });
  }

  _GoNext() {
     Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    debugPrint("navigated to the next screen");
  }

  /**/
  @override
  void initState() {
    super.initState();
    print("call start timer");
     _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(AssetsManager.splash_logo),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer
        ?.cancel(); // to make sure when we close this screen, all of its processes stop!
  }
}
