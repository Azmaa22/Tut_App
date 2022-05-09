import 'package:flutter_mvvm/domain/on_boarding_model/on_boarding_slider_model.dart';

class SliderViewObject {
  OnBoardingSlider onBoardingSlider;
  int numberOfSlider;
  int currentIndexOfSlider;
  SliderViewObject(
    this.onBoardingSlider,
    this.numberOfSlider,
    this.currentIndexOfSlider,
  );
}
