import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/featurs/on_boarding/presentation/views/widgets/custom_widget_onboarding.dart';
import 'package:flutter/material.dart';

class PageViewOnBoarding extends StatelessWidget {
  const PageViewOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        children: const [
          CustomWidgetOnboarding(
            backgroundImgae: Assets.assetsBackground1OnBoarding,
            image: Assets.assetsImage1OnBoarding,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('مرحبًا بك في '), Text('HUB'), Text('Fruit')],
            ),
            subTitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          ),
          CustomWidgetOnboarding(
            backgroundImgae: Assets.assetsBackground2OnBoarding,
            image: Assets.assetsImage2OnBoarding,
            title: Text(
              'ابحث وتسوق',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0C0D0D) /* Grayscale-950 */,
                fontSize: 23,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
              ),
            ),
            subTitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          ),
        ],
      ),
    );
  }
}
