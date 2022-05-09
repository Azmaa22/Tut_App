import 'package:flutter/material.dart';
import 'package:flutter_mvvm/presentation/on_boarding_screen/on_boarding_view_model/on_boarding_view_model_routes.dart';
import 'package:flutter_mvvm/presentation/on_boarding_screen/view/widgets/widgets.dart';
import 'package:flutter_mvvm/utilities/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  final OnboardingViewModel _onboardingViewModel = OnboardingViewModel();

  _bindViewModelWithView() {
    _onboardingViewModel.start();
  }

  @override
  void initState() {
    super.initState();
    _bindViewModelWithView();
  }

  @override
  void dispose() {
    super.dispose();
    _onboardingViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _onboardingViewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentPage(snapshot.data);
      },
    );
  }

  Widget _getContentPage(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.numberOfSlider,
          onPageChanged: (index) {
            _onboardingViewModel.onPageChange(index);
          },
          itemBuilder: (BuildContext context, int index) {
            return OnBoardingContentPage(
              onBoardingSlider: sliderViewObject.onBoardingSlider,
            );
          },
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(PaddingManager.p8),
                  child: TextButton(
                    onPressed: () {
                      print('Skip');
                    },
                    child: Text(
                      StringsManager.skip,
                      textAlign: TextAlign.end,
                      style: textButtonStyle,
                    ),
                  ),
                ),
              ),
              Container(
                color: ColorManager.primary,
                child: _getBottomSheetWidget(sliderViewObject),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject? sliderViewObject) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // left arrow
        sliderViewObject!.currentIndexOfSlider == 0
            ? Container()
            : ArrowButton(
                iconName: ImageManager.leftArrowIc,
                onPress: () {
                  // go to previous slide
                  _pageController.animateToPage(
                    _onboardingViewModel.goToPreviousPage(),
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.easeInOut,
                  );
                },
              ),

        // circles indicator
        Row(
          children: [
            for (int i = 0; i < sliderViewObject.numberOfSlider; i++)
              Padding(
                padding: const EdgeInsets.all(PaddingManager.p8),
                child: _getProperCircle(
                  i,
                  sliderViewObject.currentIndexOfSlider,
                ),
              )
          ],
        ),

        sliderViewObject.currentIndexOfSlider ==
                sliderViewObject.numberOfSlider - 1
            ? Container()
            :
            // right arrow
            ArrowButton(
                iconName: ImageManager.rightArrowIc,
                onPress: () {
                  _pageController.animateToPage(
                    _onboardingViewModel.goToNextPage(),
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.easeInOut,
                  );
                },
              ),
      ],
    );
  }

  Widget _getProperCircle(int index, int currentPage) {
    if (index == currentPage) {
      return SvgPicture.asset(ImageManager.hollowCircleIc); // selected slider
    } else {
      return SvgPicture.asset(ImageManager.solidCircleIc); // unselected slider
    }
  }
}

final textButtonStyle = TextStyle(
  color: ColorManager.primary,
  fontFamily: FontFamilyManager.fontFamily,
  fontWeight: FontWeightManager.regular,
  fontSize: FontSizeManager.s16,
);
