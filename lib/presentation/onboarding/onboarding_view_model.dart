import 'dart:async';
import 'package:mvvmmanualsdk12/presentation/base/base_view_model.dart';
import 'package:mvvmmanualsdk12/presentation/onboarding/onboarding_shelf.dart';
import 'package:mvvmmanualsdk12/presentation/resources/resources_shelf.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
  //Stream Controller
  final StreamController _streamController =
      StreamController<SlideViewObject>();

  //Variables
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  //Inputs
  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _list.length-1) {
      _currentIndex = 0;
    }
    _postDataToView();
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--;
    if (previousIndex == 0) {
      _currentIndex = _list.length - 1;
    }
    _postDataToView();
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  //Outputs
  @override
  // TODO: implement outputSliderViewObject
  Stream<SlideViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  //Private Funcs
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

  _postDataToView() {
    inputSliderViewObject.add(
      SlideViewObject(
          currentIndex: _currentIndex,
          numOfSlides: _list.length,
          sliderObject: _list[_currentIndex]),
    );
  }
}

//Orders
abstract class OnboardingViewModelInputs {
  void goNext();
  void goPrevious();
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

//Results
abstract class OnboardingViewModelOutputs {
  Stream<SlideViewObject> get outputSliderViewObject;
}

//Model
class SlideViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SlideViewObject({
    required this.currentIndex,
    required this.numOfSlides,
    required this.sliderObject,
  });
}
