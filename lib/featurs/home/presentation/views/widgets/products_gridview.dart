import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class ProductsGridview extends StatelessWidget {
  const ProductsGridview({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 225,
      ),
      itemBuilder: (context, index) => FruitItem(product: products[index]),
      itemCount: products.length,
    );
  }
}
