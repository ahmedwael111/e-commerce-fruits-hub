import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo.dart';
import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/fav_user_orders_repo.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/fav_user_orders/fav_user_orders_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/stream_for_fav_user_products_cubit/stream_for_fav_user_products_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/favorta_order_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavorteOrderView extends StatelessWidget {
  const FavorteOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    FavUserProductsEditsCubit(getIt<FavUserOrdersRepo>()),
          ),
          BlocProvider(
            create: (context) => ProductsCubit(getIt<ProductsRepo>()),
          ),
          BlocProvider.value(
            value: StreamForFavUserProductsCubit(getIt<FavUserOrdersRepo>())
              ..fetchFavUserOrders(),
          ),
        ],
        child: FavortaOrderViewBodyBlocConsumer1(),
      ),
    );
  }
}
