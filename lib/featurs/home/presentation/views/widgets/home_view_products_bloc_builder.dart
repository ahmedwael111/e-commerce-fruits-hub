import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/helper_functions.dart/dummy_products.dart';
import 'package:e_commerce_fruits_hub/core/services/get_it_server_locator.dart';
import 'package:e_commerce_fruits_hub/core/widgets/failuer_message.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/home_view_body.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/product_view_body.dart';
import 'package:e_commerce_fruits_hub/featurs/home/presentation/views/widgets/products_gridview.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/fav_user_orders_repo.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/stream_for_fav_user_products_cubit/stream_for_fav_user_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewProductsBlocBuilder extends StatefulWidget {
  const HomeViewProductsBlocBuilder({super.key});

  @override
  State<HomeViewProductsBlocBuilder> createState() =>
      _HomeViewProductsBlocBuilderState();
}

class _HomeViewProductsBlocBuilderState extends State<HomeViewProductsBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return HomeViewBody(products: state.products);
        }
        if (state is Productsfailure) {
          return FailuerMessage(errorMessage: state.errorMessage);
        }
        return Skeletonizer(child: HomeViewBody(products: dummyProducts()));
      },
    );
  }
}
