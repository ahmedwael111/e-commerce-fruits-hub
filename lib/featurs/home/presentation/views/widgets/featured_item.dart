import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/featured_item_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' show Svg;
// import 'package:flutter_svg/svg.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return AspectRatio(
      aspectRatio: 342 / 158,

      child: Container(
        width: width,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              top: 10,
              right: width * 0.30,
              child: Image.asset(Assets.assetsWatermilon2),
            ),
            Container(
              width: width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset(Assets.assetsFeaturedBackground2).image,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35),
                    Opacity(
                      opacity: 0.80,
                      child: Text(
                        'عروض العيد',
                        style: AppTextStyles.regular13.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'خصم 25%',
                      style: AppTextStyles.bold19.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 7),
                    FeaturedItemBottom(onPressed: () {}, text: 'تسوق الان'),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
