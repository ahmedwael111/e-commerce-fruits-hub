import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomWidgetOnboarding extends StatelessWidget {
  const CustomWidgetOnboarding({
    super.key,
    required this.image,
    required this.backgroundImgae,
    required this.title,
    required this.subTitle,
  });
  final String image, backgroundImgae;
  final String subTitle;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
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
              Positioned(left: 20, right: 20, top: 40, child: Text('تخط')),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
