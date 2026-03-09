import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/helper_functions.dart/dummy_products.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/core/widgets/disabled_search_text_field.dart';
import 'package:e_commerce_fruits_hub/core/widgets/failuer_message.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/main_prodcuts_view_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductViewBodyBlocBuilder extends StatefulWidget {
  const ProductViewBodyBlocBuilder({super.key});

  @override
  State<ProductViewBodyBlocBuilder> createState() =>
      _ProductViewBodyBlocBuilderState();
}

class _ProductViewBodyBlocBuilderState
    extends State<ProductViewBodyBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _onRefresh(context),
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
                  const DisabledSearchTextfield(),
                  const SizedBox(height: 24),
                  BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsSuccess) {
                        return MainMyProductsViewSection(
                          products: state.products,
                        );
                      }
                      if (state is Productsfailure) {
                        return FailuerMessage(errorMessage: state.errorMessage);
                      }
                      return Skeletonizer(
                        child: MainMyProductsViewSection(
                          products: dummyProducts(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // SliverPadding(
          //   padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          //   sliver: ProductsGridview(products: products)
          // ),
        ],
      ),
    );
  }
}

Future<void> _onRefresh(BuildContext context) async {
  // call your cubit's fetch method; await in case it returns a Future
  await BlocProvider.of<ProductsCubit>(context).getProducts();
  // small delay optional to keep the indicator visible briefly
  await Future<void>.delayed(const Duration(milliseconds: 200));
  // ignore: use_build_context_synchronously
  snakBar(context, 'تم تحديث المنتجات بنجاح');
}
