import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/core/widgets/search_text_field.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/product_header_with_refresh.dart';
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

  Future<void> _onRefresh() async {
    // call your cubit's fetch method; await in case it returns a Future
    await BlocProvider.of<ProductsCubit>(context).getProducts();
    // small delay optional to keep the indicator visible briefly
    await Future<void>.delayed(const Duration(milliseconds: 200));
    snakBar(context, 'تم تحديث المنتجات بنجاح');
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      // Wrap scrollable with AlwaysScrollableScrollPhysics so pull-to-refresh always works
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  coustomAppBar(
                    context: context,
                    title: 'المنتجات',
                    backButtonShow: false,
                  ),
                  const SizedBox(height: 24),
                  const SearchTextfield(),
                  const SizedBox(height: 24),
                  ProductHeaderWithRefresh(),
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
      ),
    );
  }
}
