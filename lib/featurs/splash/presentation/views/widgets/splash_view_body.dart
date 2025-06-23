import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SvgPicture.asset(Assets.assetsPlanet)],
        ),
        SvgPicture.asset(Assets.assetsLogoSplash),
        SvgPicture.asset(Assets.assetsCircles, fit: BoxFit.fill),
      ],
    );
  }
}
