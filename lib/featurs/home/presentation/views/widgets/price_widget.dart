import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

const String _priceUnit = 'جنيه';
const String _weightUnit = 'الكيلو';

/// Price widget with unit
class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.price});

  final num price;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${price.round()}  $_priceUnit',
            style: AppTextStyles.bold13.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          TextSpan(
            text: '/',
            style: AppTextStyles.bold13.copyWith(
              color: AppColors.lightSecondaryColor,
            ),
          ),
          TextSpan(
            text: ' $_weightUnit',
            style: AppTextStyles.bold13.copyWith(
              color: AppColors.lightSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
