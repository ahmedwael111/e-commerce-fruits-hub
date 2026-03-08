import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/helper_functions.dart/dummy_products.dart';
import 'package:e_commerce_fruits_hub/core/widgets/disabled_search_text_field.dart';
import 'package:e_commerce_fruits_hub/core/widgets/failuer_message.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridview.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/best_seller_header.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/coustom_app_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/featured_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBodyBlocBuilder extends StatefulWidget {
  const HomeViewBodyBlocBuilder({super.key});

  @override
  State<HomeViewBodyBlocBuilder> createState() =>
      _HomeViewBodyBlocBuilderState();
}

class _HomeViewBodyBlocBuilderState extends State<HomeViewBodyBlocBuilder> {
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
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  CoustomAppBar(),
                  const SizedBox(height: 24),
                  DisabledSearchTextfield(),
                  const SizedBox(height: 24),
                  AspectRatio(
                    aspectRatio: 342 / 158,
                    child: FeaturedListview(),
                  ),
                  const SizedBox(height: 12),
                  BestSellerHeader(),
                  const SizedBox(height: 12),
                  BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsSuccess) {
                        return ProductsGridview(products: state.products);
                      }
                      if (state is Productsfailure) {
                        return FailuerMessage(errorMessage: state.errorMessage);
                      }
                      return Skeletonizer(
                        child: ProductsGridview(products: dummyProducts()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
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
