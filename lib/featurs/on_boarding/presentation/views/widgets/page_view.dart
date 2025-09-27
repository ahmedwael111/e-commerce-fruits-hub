import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/custom_widget_onboarding.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';

class PageViewOnBoarding extends StatelessWidget {
  const PageViewOnBoarding({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
      controller: pageController,
      children: [
        CustomWidgetOnboarding(
          vis: true,
          backgroundImgae: Assets.assetsBackground1OnBoarding,
          image: Assets.assetsImage1OnBoarding,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحبًا بك في ', style: AppTextStyles.bold23),
              Text(
                'HUB',
                style: AppTextStyles.bold23.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                'Fruit',
                style: AppTextStyles.bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        CustomWidgetOnboarding(
          vis: false,
          backgroundImgae: Assets.assetsBackground2OnBoarding,
          image: Assets.assetsImage2OnBoarding,
          title: Text(
            'ابحث وتسوق',
            textAlign: TextAlign.center,
            style: AppTextStyles.bold23,
          ),
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
        ),
      ],
    );
  }
}
