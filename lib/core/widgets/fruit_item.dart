import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            right: 8,
            child: Icon(Icons.favorite_border_outlined),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(Assets.assetsWatermilon2),
                ),
                SizedBox(height: 24),
                ListTile(
                  title: Text(
                    'بطيخ',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.simibold13,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '20جنية ',
                          style: AppTextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor /* Grayscale-900 */,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: AppTextStyles.bold13.copyWith(
                            color:
                                AppColors
                                    .lightSecondaryColor /* Grayscale-900 */,
                          ),
                        ),
                        TextSpan(
                          text: ' الكيلو',
                          style: AppTextStyles.bold13.copyWith(
                            color:
                                AppColors
                                    .lightSecondaryColor /* Grayscale-500 */,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: Container(
                    width: 42,
                    height: 42,
                    decoration: ShapeDecoration(
                      color: AppColors.primaryColor /* green-50 */,
                      shape: OvalBorder(),
                    ),
                    child: Icon(
                      Icons.add_rounded,
                      size: 32,
                      color: Colors.white /* green-300 */,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
