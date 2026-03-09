import 'package:e_commerce_fruits_hub/core/utils/app_colors.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

const Color _organicsItemSubtitleColor = Color(0xFF969899);

/// Info column for organics item
class OrganicsItemInfoColumn extends StatelessWidget {
  const OrganicsItemInfoColumn({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          title,
          textAlign: TextAlign.right,
          style: AppTextStyles.bold13.copyWith(
            color: AppColors.lightprimaryColor,
          ),
        ),
        Text(
          subTitle,
          textAlign: TextAlign.right,
          style: AppTextStyles.simibold13.copyWith(
            color: _organicsItemSubtitleColor,
          ),
        ),
      ],
    );
  }
}
