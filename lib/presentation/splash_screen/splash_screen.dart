import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utilities/constants/color_manager.dart';
import 'package:flutter_mvvm/utilities/constants/image_manager.dart';
import 'package:flutter_mvvm/utilities/constants/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startTimer() {
    _timer = Timer(
        const Duration(
          seconds: 2,
        ),
        _goToOnBoardingScreens);
  }

  void _goToOnBoardingScreens() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(
            ImageManager.splashLogo,
          ),
        ),
      ),
    );
  }
}
