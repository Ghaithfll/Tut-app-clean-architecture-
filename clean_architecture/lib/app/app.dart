import 'package:clean_architecture/presentation/resources/routes_manager.dart';
import 'package:clean_architecture/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); //                          private constructor
  static MyApp _instance = MyApp._internal(); // the single instance
  factory MyApp() =>
      _instance; //               to access the instance with the same MyApp name
  /*
     the above 3 lines are the singleton 
  */
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(),
      onGenerateRoute: RouteGenerator.getRoute,// like informing the app from where it should takes the routes
           //                                    cuz this triggers whenever navigation is needed
      initialRoute: Routes.splashRoute,
      debugShowCheckedModeBanner: false,

    );
  }
}
