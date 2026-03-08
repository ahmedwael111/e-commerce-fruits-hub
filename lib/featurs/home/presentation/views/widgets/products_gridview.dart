import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class ProductsGridview extends StatelessWidget {
  const ProductsGridview({super.key, required this.products, this.physics});
  final List<ProductEntity> products;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? GridView.builder(
          physics: physics ?? NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 16,
            childAspectRatio: 163 / 225,
          ),
          itemBuilder:
              (context, index) => FruitItem(
                key: ValueKey(products[index].productId),
                product: products[index],
                
              ),
          itemCount: products.length,
        )
        : Padding(
          padding: const EdgeInsets.symmetric(vertical: 150),
          child: Text(
            'لا توجد منتجات في هذا القسم',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        );
  }
}
