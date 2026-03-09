import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/card_item_entity.dart';
import 'package:flutter/material.dart';

import 'action_buttons_of_one_product.dart';
import 'product_info_column.dart';

const double _itemSpacing = 20;

/// Product Details Row containing name, price, rating, and action buttons
class ProductDetailsRow extends StatelessWidget {
  const ProductDetailsRow({
    super.key,
    required this.productEntity,
    required this.cardItemEntity,
  });

  final ProductEntity productEntity;
  final CardItemEntity? cardItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ProductInfoColumn(productEntity: productEntity)),
        const SizedBox(width: _itemSpacing),
        ActionBottonsOfOneProduct(
          productEntity: productEntity,
          cardItemEntity: cardItemEntity,
        ),
        const SizedBox(width: _itemSpacing),
      ],
    );
  }
}
