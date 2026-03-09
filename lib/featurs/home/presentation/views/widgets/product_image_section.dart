import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/utils/assets.dart';
import 'package:e_commerce_fruits_hub/core/widgets/cached_netwok_image.dart';
import 'package:flutter/material.dart';

import 'back_button.dart';

const double _productImageHeight = 0.4;
const double _productImageSidePadding = 0.25;

/// Product Image Section with back button
class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: MediaQuery.of(context).size.height * _productImageHeight,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.assetsEllipseOfProduct, fit: BoxFit.fill),
          ),
          Positioned(
            bottom: 36,
            left: width * _productImageSidePadding,
            right: width * _productImageSidePadding,
            child: CustomNetworkImage(
              imageUrl: productEntity.imageUrl!,
              scaleValue: 0.8,
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: BackButtonWidget(onTap: () => Navigator.pop(context)),
          ),
        ],
      ),
    );
  }
}
