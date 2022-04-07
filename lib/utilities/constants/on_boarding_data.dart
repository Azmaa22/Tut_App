import 'package:flutter_mvvm/utilities/constants/image_manager.dart';
import 'package:flutter_mvvm/utilities/constants/strings_manager.dart';

class OnBoardingSlider {
  String title, subTitle, imageName;
  OnBoardingSlider({
    required this.title,
    required this.subTitle,
    required this.imageName,
  });
  static List<OnBoardingSlider> getSliderList() => [
        OnBoardingSlider(
          title: StringsManager.onBoardingTitle1,
          subTitle: StringsManager.onBoardingSubTitle1,
          imageName: ImageManager.onBoardingLogo1,
        ),
        OnBoardingSlider(
          title: StringsManager.onBoardingTitle2,
          subTitle: StringsManager.onBoardingSubTitle2,
          imageName: ImageManager.onBoardingLogo2,
        ),
        OnBoardingSlider(
          title: StringsManager.onBoardingTitle3,
          subTitle: StringsManager.onBoardingSubTitle3,
          imageName: ImageManager.onBoardingLogo3,
        ),
        OnBoardingSlider(
          title: StringsManager.onBoardingTitle4,
          subTitle: StringsManager.onBoardingSubTitle4,
          imageName: ImageManager.onBoardingLogo4,
        ),
      ];
}
