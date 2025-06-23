import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce_fruits_hub/featurs/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());

    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}
