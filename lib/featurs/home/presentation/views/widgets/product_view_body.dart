import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coutom_app_bar.dart';
import 'package:e_commerce_fruits_hub/core/widgets/disabled_search_text_field.dart';
import 'package:e_commerce_fruits_hub/core/widgets/search_text_field.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/domin/entitis/categores_of_products_enitites.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/best_seller_header.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/main_prodcuts_view_section.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/main_product_view_header.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/our_products_item.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/product_header_with_refresh.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridView_blocBuilder.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/product_header.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridview.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/fav_user_orders_repo.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/stream_for_fav_user_products_cubit/stream_for_fav_user_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              StreamForFavUserProductsCubit(getIt<FavUserOrdersRepo>())
                ..fetchFavUserOrders(),
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
                  MainMyProductsViewSection(products: products),
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

// Future<void> _onRefresh() async {
//   // call your cubit's fetch method; await in case it returns a Future
//   // await BlocProvider.of<ProductsCubit>(context).getProducts();
//   // small delay optional to keep the indicator visible briefly
//   await Future<void>.delayed(const Duration(milliseconds: 200));
//   snakBar(context, 'تم تحديث المنتجات بنجاح');
// }



