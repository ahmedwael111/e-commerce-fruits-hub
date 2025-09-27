import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/onBoarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String routeName = 'onBoarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OnboardingViewBody());
  }
}
