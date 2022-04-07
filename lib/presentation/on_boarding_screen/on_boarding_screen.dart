import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm/presentation/on_boarding_screen/widgets/arrow_button.dart';
import 'package:flutter_mvvm/presentation/on_boarding_screen/widgets/on_boarding_content_page.dart';
import 'package:flutter_mvvm/utilities/constants/color_manager.dart';
import 'package:flutter_mvvm/utilities/constants/font_manager.dart';
import 'package:flutter_mvvm/utilities/constants/image_manager.dart';
import 'package:flutter_mvvm/utilities/constants/on_boarding_data.dart';
import 'package:flutter_mvvm/utilities/constants/sizing_manager.dart';
import 'package:flutter_mvvm/utilities/constants/strings_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<OnBoardingSlider> _list = OnBoardingSlider.getSliderList();
  final PageController _pageController = PageController(initialPage: 0);
  late int currentPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      currentPage = _pageController.initialPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      // appBar: AppBar(
      //   backgroundColor: ColorManager.white,
      //   elevation: SizedBoxManager.sb1_5,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: ColorManager.white,
      //     statusBarBrightness: Brightness.dark,
      //     statusBarIconBrightness: Brightness.dark,
      //   ),
      // ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return OnBoardingContentPage(
            onBoardingSlider: _list[index],
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
              child: _getBottomSheetWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // left arrow
        currentPage == 0
            ? Container()
            : ArrowButton(
                iconName: ImageManager.leftArrowIc,
                onPress: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                  );
                },
              ),

        // circles indicator
        Row(
          children: [
            for (int i = 0; i < _list.length; i++)
              Padding(
                padding: const EdgeInsets.all(PaddingManager.p8),
                child: _getProperCircle(i),
              )
          ],
        ),

        currentPage == _list.length - 1
            ? Container()
            :
            // right arrow
            ArrowButton(
                iconName: ImageManager.rightArrowIc,
                onPress: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                  );
                },
              ),
      ],
    );
  }

  Widget _getProperCircle(int index) {
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
