import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvmmanualsdk12/presentation/onboarding/onboarding_shelf.dart';
import 'package:mvvmmanualsdk12/presentation/resources/resources_shelf.dart';


class GetBottomSheetWidget extends StatelessWidget {
  final List<SliderObject> list;
  final int currentIndex;
  const GetBottomSheetWidget({
    Key? key,
    required this.list,
    required this.currentIndex,
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
            onTap: () {},
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < list.length; i++)
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
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
