import 'package:e_commerce_fruits_hub/core/cubits/products/product_updates_cubit/product_updats_cubit_cubit.dart';
import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo.dart';
import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/product_gridView_blocConsumer_favProduct.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  static const String routeName = 'products';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
        ),
        
      ],
      child: Scaffold(
        body: MultiBlocListenerForProductsUpdates(
          child: ProductViewBody(),
        ), // this nested providers is for add fav product, i added it here because the flowing widget tree is slivers and it have alot of issues
      ),
    );
  }
}
