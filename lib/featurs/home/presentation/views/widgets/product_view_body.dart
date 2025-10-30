import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/core/widgets/search_text_field.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridView_blocBuilder.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/product_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              children: [
                SizedBox(height: 16),
                coustomAppBar(
                  context: context,
                  title: 'المنتجات',
                  backButtonShow: false,
                ),
                const SizedBox(height: 24),
                SearchTextfield(),
                const SizedBox(height: 24),

                ProductsHeader(
                  resultsCount:
                      BlocProvider.of<ProductsCubit>(context).productsLength,
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          sliver: ProductsGridViewBlocBuilder(),
        ),
      ],
    );
  }
}
