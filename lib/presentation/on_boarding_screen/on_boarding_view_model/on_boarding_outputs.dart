import 'package:flutter_mvvm/presentation/on_boarding_screen/on_boarding_view_model/slider_view_object.dart';

abstract class OnboardingViewModelOutputs {
// outputs mean data or results that our view model will be sent to view

  Stream<SliderViewObject> get outputSliderViewObject;
}
