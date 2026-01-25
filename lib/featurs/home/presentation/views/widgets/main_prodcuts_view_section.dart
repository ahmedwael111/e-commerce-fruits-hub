import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/best_seller_header.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/listView_of_main_categoreise_of_products.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/main_product_view_header.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/product_view_body.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridview.dart';
import 'package:flutter/material.dart';

class MainMyProductsViewSection extends StatelessWidget {
  const MainMyProductsViewSection({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainProductsViewHeader(),
        const SizedBox(height: 12),
        ListViewOfMainCategriesOfProducts(),
        const SizedBox(height: 24),
        BestSellerHeader(),
        const SizedBox(height: 12),
        ProductsGridview(products: products),
      ],
    );
  }
}