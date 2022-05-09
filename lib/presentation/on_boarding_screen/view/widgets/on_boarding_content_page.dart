import 'package:flutter/material.dart';
import 'package:flutter_mvvm/domain/on_boarding_model/on_boarding_slider_model.dart';
import 'package:flutter_mvvm/utilities/constants/sizing_manager.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingContentPage extends StatelessWidget {
  final OnBoardingSlider onBoardingSlider;
  const OnBoardingContentPage({Key? key, required this.onBoardingSlider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: SizedBoxManager.sb60,
        ),
        Text(
          onBoardingSlider.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(
          height: SizedBoxManager.sb20,
        ),
        Text(
          onBoardingSlider.subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(
          height: SizedBoxManager.sb80,
        ),
        SvgPicture.asset(
          onBoardingSlider.imageName,
        ),
      ],
    );
  }
}
