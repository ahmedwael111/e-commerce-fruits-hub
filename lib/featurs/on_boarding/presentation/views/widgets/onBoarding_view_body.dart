import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/coustom_bottom.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/page_view.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageViewOnBoarding(),
        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: AppColors.primaryColor.withValues(
              alpha: .5,
            ), // Grayscale-500
            // Grayscale-950
          ),
        ),
        SizedBox(height: 29),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CoustomBottom(onPressed: () {}, text: 'ابدأ الان'),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
