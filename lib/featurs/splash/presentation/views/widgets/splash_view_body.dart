import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/services/firebase_auth_service.dart';
import 'package:e_commerce_fruits_hub/core/services/shared_prefrenseces_singleton.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/sginin_view.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/main_view.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigationLogic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.assetsPlanet)],
        ),
        SvgPicture.asset(Assets.assetsLogoSplash),
        SvgPicture.asset(Assets.assetsCircles, fit: BoxFit.fill),
      ],
    );
  }

  void executeNavigationLogic() {
    Future.delayed(const Duration(seconds: 3), () {
      bool condition = Prefs.getbool(kisOnBordingSeen);
      if (condition) {
        var loggedIn = FirebaseAuthService().isUserLoggedIn();
        if (loggedIn) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
          return;
        } else {
          Navigator.pushReplacementNamed(context, SigninView.routeName);
          return;
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
