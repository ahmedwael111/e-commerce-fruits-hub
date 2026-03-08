import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo.dart';
import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/favorta_order_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavorteProductsView extends StatelessWidget {
  const FavorteProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductsCubit(getIt<ProductsRepo>()),
          ),
        ],
        child: FavorteProductsViewBodyBlocConsumer1(),
      ),
    );
  }
}
