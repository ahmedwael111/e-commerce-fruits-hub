import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/services/shared_prefrenseces_singleton.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/sginin_view.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/coustom_bottom.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/page_view.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController _pageController;
  var _currentPage = 0;
  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      _currentPage = _pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          PageViewOnBoarding(pageController: _pageController),
          SizedBox(height: 32),
          DotsIndicator(
            dotsCount: 2,
            // position: _currentPage.toDouble(),
            decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color:
                  _currentPage == 1
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withValues(alpha: .5),

              // Grayscale-500
              // Grayscale-950
            ),
          ),
          Spacer(),

          Visibility(
            visible: _currentPage == 1,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: CoustomBottom(
                onPressed: () {
                  Prefs.setbool(kisOnBordingSeen, true);
                  Navigator.pushReplacementNamed(context, SigninView.routeName);
                },
                text: 'ابدأ الان',
              ),
            ),
          ),
          SizedBox(height: 43),
        ],
      ),
    );
  }
}
