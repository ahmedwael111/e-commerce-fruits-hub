import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/core/widgets/disabled_search_text_field.dart';
import 'package:e_commerce_fruits_hub/core/widgets/search_text_field.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridview.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/best_seller_header.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridView_blocBuilder.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/coustom_app_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/featured_listview.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/fav_user_orders_repo.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/stream_for_fav_user_products_cubit/stream_for_fav_user_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              StreamForFavUserProductsCubit(getIt<FavUserOrdersRepo>())
                ..fetchFavUserOrders(),
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
                  ProductsGridview(products: products),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
