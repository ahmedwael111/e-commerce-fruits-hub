import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'price_widget.dart';
import 'rating_widget.dart';

/// Product info column with name, price, and rating
class ProductInfoColumn extends StatelessWidget {
  const ProductInfoColumn({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productEntity.name,
          textAlign: TextAlign.right,
          style: AppTextStyles.bold16,
        ),
        const SizedBox(height: 4),
        PriceWidget(price: productEntity.price),
        const SizedBox(height: 8),
        RatingWidget(
          rating: productEntity.avrageRate,
          reviewCount: productEntity.ratingCount,
        ),
      ],
    );
  }
}
