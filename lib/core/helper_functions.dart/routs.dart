import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/sginin_view.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/signup_view.dart';
import 'package:e_commerce_fruits_hub/featurs/best_selling_fruit/presentation/views/best_selling_view.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/home_view.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce_fruits_hub/featurs/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (_) => const BestSellingView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (_) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());

    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}
