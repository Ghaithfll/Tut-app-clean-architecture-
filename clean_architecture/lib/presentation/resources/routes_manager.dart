import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:clean_architecture/presentation/screens/forgot_password/forgot_password_view.dart';
import 'package:clean_architecture/presentation/screens/login/login_view.dart';
import 'package:clean_architecture/presentation/screens/main_view/main_view.dart';
import 'package:clean_architecture/presentation/screens/onBoarding/onBoarding_view.dart';
import 'package:clean_architecture/presentation/screens/register/register_view.dart';
import 'package:clean_architecture/presentation/screens/splash/splash_view.dart';
import 'package:clean_architecture/presentation/screens/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";// only slash cuz this is the App root(1st) screen
  static const String loginRoute = "/login";
  static const String onBoardingRoute = "/onBoarding";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String registerRoute = "/register";
  static const String storeDetailsRoute = "/storeDetails";
  static const String mainRoute = "/main";
}

class RouteGenerator {//   convert those strings '/login' into an actual route  
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => SplashView(),
        );

      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (_) => MainView(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => RegisterView(),
        );
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => StoreDetailsView(),
        );
        case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => OnboardingView(),
        );
      default:
        return UnDefinedRoute();
    }
  }

  static Route<dynamic> UnDefinedRoute() {
    // in case the switch had a problem and didnt apply any case
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("No Route Found"),// whenever u have something todo later, write a todo comment
        ), // todo: move this to Strings manager , (we dont want hard coded things)
        body: Center(
          child: const Text(AppStrings.NoRoute),
        ), 
      ),
    );
  }
}
