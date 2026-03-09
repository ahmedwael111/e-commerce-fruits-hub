import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

const Color _reviewLightColor = Color(0xFF9796A1);

/// Product Description widget
class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: AppTextStyles.regular13.copyWith(color: _reviewLightColor),
    );
  }
}
