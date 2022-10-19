// ignore_for_file: use_key_in_widget_constructors, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvmmanualsdk12/presentation/onboarding/onboarding_shelf.dart';
import 'package:mvvmmanualsdk12/presentation/onboarding/onboarding_view_model.dart';
import 'package:mvvmmanualsdk12/presentation/resources/color_manager.dart';
import 'package:mvvmmanualsdk12/presentation/resources/resources_shelf.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pageController = PageController(initialPage: 0);
  OnboardingViewModel _viewModel = OnboardingViewModel();
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SlideViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContent(snapshot.data);
      },
    );
  }

  Widget _getContent(SlideViewObject? data) {
    if (data == null) {
      return Container();
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.transP,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: data.numOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(
              data.sliderObject,
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
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: ColorManager.white,
                    ),
                  ),
                ),
              ),
              GetBottomSheetWidget(
                previousIndex: _viewModel.goPrevious,
                nextIndex: _viewModel.goNext,
                pageController: _pageController,
                currentIndex: data.currentIndex,
                listLength: data.numOfSlides,
              ),
            ],
          ),
        ),
      );
    }
  }
}
