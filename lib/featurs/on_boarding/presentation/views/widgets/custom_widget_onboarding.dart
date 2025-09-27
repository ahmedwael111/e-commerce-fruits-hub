import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/services/shared_prefrenseces_singleton.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/presentation/views/sginin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomWidgetOnboarding extends StatelessWidget {
  const CustomWidgetOnboarding({
    super.key,
    required this.image,
    required this.backgroundImgae,
    required this.title,
    required this.subTitle,
    required this.vis,
  });
  final String image, backgroundImgae;
  final String subTitle;
  final Widget title;
  final bool vis;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImgae,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: vis,
                child: Positioned(
                  right: 16,
                  top: 16,
                  child: GestureDetector(
                    onTap: () {
                      Prefs.setbool(kisOnBordingSeen, true);
                      Navigator.pushReplacementNamed(
                        context,
                        SigninView.routeName,
                      );
                    },
                    child: Text(
                      'تخط',
                      style: AppTextStyles.regular13.copyWith(
                        color: const Color(0xFF4E5556),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.simibold13.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
        ),
      ],
    );
  }
}
