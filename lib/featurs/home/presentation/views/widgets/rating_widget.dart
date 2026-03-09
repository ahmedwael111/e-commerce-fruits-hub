import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

const double _starIconSize = 20;
const Color _reviewLightColor = Color(0xFF9796A1);

/// Rating widget with review link
class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.rating,
    required this.reviewCount,
  });

  final num rating;
  final num reviewCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 9,
      children: [
        const Icon(Icons.star, color: Colors.amberAccent, size: _starIconSize),
        Text(rating.toString(), style: AppTextStyles.simibold13),
        Text(
          '($reviewCount+)',
          style: AppTextStyles.regular13.copyWith(color: _reviewLightColor),
        ),
        Text(
          'المراجعه',
          style: AppTextStyles.bold13.copyWith(
            color: AppColors.primaryColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
