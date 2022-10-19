import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvmmanualsdk12/presentation/resources/resources_shelf.dart';
class GetProperCircle extends StatelessWidget {
  final int currentIndex;
  final int index;
  const GetProperCircle({
    Key? key,
    required this.currentIndex,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.solidCircle);
    } else {
      return SvgPicture.asset(ImageAssets.hollowCircle);
    }
  }
}
