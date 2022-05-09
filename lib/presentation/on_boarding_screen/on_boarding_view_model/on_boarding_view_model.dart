import 'dart:async';

import 'package:flutter_mvvm/domain/on_boarding_model/on_boarding_slider_model.dart';
import 'package:flutter_mvvm/presentation/on_boarding_screen/on_boarding_view_model/on_boarding_view_model_routes.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
  final StreamController _onBoardingStreamController =
      StreamController<SliderViewObject>();
  late final List<OnBoardingSlider> _sliderList;
  late int _currentIndexOfSlider;

  @override
  void dispose() {
    _onBoardingStreamController.close();
  }

  @override
  void start() {
    _currentIndexOfSlider = 0;
    _sliderList = _getSliderData();
    _postDataToView();
  }

  @override
  int goToNextPage() {
    int nextIndex = ++_currentIndexOfSlider;
    if (nextIndex == _sliderList.length) {
      nextIndex = 0;
    }
    _postDataToView();
    return nextIndex;
  }

  @override
  int goToPreviousPage() {
    int previousIndex = --_currentIndexOfSlider;
    if (previousIndex == _sliderList.length) {
      previousIndex = 0;
    }
    _postDataToView();
    return previousIndex;
  }

  @override
  void onPageChange(int index) {
    _currentIndexOfSlider = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _onBoardingStreamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _onBoardingStreamController.stream
          .map((sliderViewObject) => sliderViewObject);

  // onboarding private functions
  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        _sliderList[_currentIndexOfSlider],
        _sliderList.length,
        _currentIndexOfSlider,
      ),
    );
  }

  List<OnBoardingSlider> _getSliderData() => OnBoardingSlider.getSliderList();
}
