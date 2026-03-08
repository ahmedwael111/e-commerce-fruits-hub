import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridview.dart';
import 'package:flutter/material.dart';

class FavProductsViewBody extends StatelessWidget {
  const FavProductsViewBody({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              children: [
                const SizedBox(height: 16),
                coustomAppBar(
                  context: context,
                  title: 'المفضلة',
                  backButtonShow: true,
                  showNotficationWidget: false,
                ),
                const SizedBox(height: 24),
                ProductsGridview(products: products),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
