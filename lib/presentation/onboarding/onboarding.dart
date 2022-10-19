// ignore_for_file: use_key_in_widget_constructors, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvmmanualsdk12/presentation/onboarding/onboarding_shelf.dart';
import 'package:mvvmmanualsdk12/presentation/resources/color_manager.dart';
import 'package:mvvmmanualsdk12/presentation/resources/resources_shelf.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() => [
        SliderObject(
          ImageAssets.onboardingLogo1,
          AppStrings.onBoardingSubTitle1,
          AppStrings.onBoardingTitle1,
        ),
        SliderObject(
          ImageAssets.onboardingLogo2,
          AppStrings.onBoardingSubTitle2,
          AppStrings.onBoardingTitle2,
        ),
        SliderObject(
          ImageAssets.onboardingLogo3,
          AppStrings.onBoardingSubTitle3,
          AppStrings.onBoardingTitle3,
        ),
        SliderObject(
          ImageAssets.onboardingLogo4,
          AppStrings.onBoardingSubTitle4,
          AppStrings.onBoardingTitle4,
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: AppSize.s1_5,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(
            _list[index],
          );
        },
      ),
      bottomSheet: Container(
        color: ColorManager.primary,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(AppStrings.skip, textAlign: TextAlign.end),
              ),
            ),
            GetBottomSheetWidget(
              currentIndex: _currentIndex,
              list: _list,
            ),
          ],
        ),
      ),
    );
  }
}
