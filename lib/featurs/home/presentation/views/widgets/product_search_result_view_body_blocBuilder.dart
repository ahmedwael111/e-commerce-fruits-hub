import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/search_product_cubit/search_product_cubit.dart';
import 'package:e_commerce_fruits_hub/core/helper_functions.dart/dummy_products.dart';
import 'package:e_commerce_fruits_hub/core/utils/app_styles.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/core/widgets/search_text_field.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/product_header.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/product_header_with_refresh.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductSearchResultViewBodyBlocBuilder extends StatefulWidget {
  const ProductSearchResultViewBodyBlocBuilder({super.key, this.categoryName});
  final String? categoryName;
  @override
  State<ProductSearchResultViewBodyBlocBuilder> createState() =>
      _ProductSearchResultViewBodyBlocBuilderState();
}

class _ProductSearchResultViewBodyBlocBuilderState
    extends State<ProductSearchResultViewBodyBlocBuilder> {
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    if (widget.categoryName == null) {
      _focusNode.requestFocus();
    }
    if (widget.categoryName != null) {
      context.read<SearchProductCubit>().searchProducts(widget.categoryName!);
    }
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            coustomAppBar(
              context: context,
              title: 'البحث',
              backButtonShow: true,
            ),
            const SizedBox(height: 24),
            SearchTextfield(focusNode: _focusNode),
            const SizedBox(height: 24),
            ProductsHeader(
              resultsCount: context.watch<SearchProductCubit>().prodcutsLength,
            ),
            const SizedBox(height: 12),
            //
            BlocBuilder<SearchProductCubit, SearchProductState>(
              builder: (context, state) {
                if (state is SearchProductLoading) {
                  return Skeletonizer(
                    child: ProductsGridview(products: dummyProducts()),
                  );
                } else if (state is SearchProductSuccess) {
                  return ProductsGridview(products: state.products);
                } else if (state is SearchProductFailure) {
                  final errorMessage = state.errorMessage;
                  return Center(child: Text('Error: $errorMessage'));
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 150),
                  child: Text(
                    "أبدأ بالبحث عن منتجات",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bold23,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
