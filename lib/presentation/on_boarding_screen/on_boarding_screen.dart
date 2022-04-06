import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utilities/constants/color_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: const Center(
        child: Text(
          'Welcome',
        ),
      ),
    );
  }
}
