import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utilities/constants/routes_manager.dart';
import 'package:flutter_mvvm/utilities/navigation/route_generator.dart';
import 'package:flutter_mvvm/utilities/styles/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // default constructor

  const MyApp._internal(); // private named constructor

  static const MyApp instance = MyApp
      ._internal(); // create instance from this class using singleton design pattern to use the same instance in the whole of app

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
