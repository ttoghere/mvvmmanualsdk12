import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvmmanualsdk12/presentation/onboarding/onboarding_shelf.dart';
import 'package:mvvmmanualsdk12/presentation/resources/resources_shelf.dart';

class GetBottomSheetWidget extends StatelessWidget {
  final Function nextIndex;
  final Function previousIndex;
  final PageController pageController;
  final int listLength;
  final int currentIndex;
  const GetBottomSheetWidget({
    Key? key,
    required this.listLength,
    required this.currentIndex,
    required this.pageController,
    required this.nextIndex,
    required this.previousIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.leftArrow),
            ),
            onTap: () {
              pageController.animateToPage(
                previousIndex(),
                duration: Duration(
                  milliseconds: DurationConsts.d300,
                ),
                curve: Curves.bounceInOut,
              );
            },
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < listLength; i++)
              Padding(
                padding: EdgeInsets.all(AppPadding.p8),
                child: GetProperCircle(
                  index: i,
                  currentIndex: currentIndex,
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.rightArrow),
            ),
            onTap: () {
              pageController.animateToPage(
                nextIndex(),
                duration: Duration(
                  milliseconds: DurationConsts.d300,
                ),
                curve: Curves.bounceInOut,
              );
            },
          ),
        ),
      ],
    );
  }
}
