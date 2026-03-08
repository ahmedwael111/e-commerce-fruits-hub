import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/helper_functions.dart/dummy_products.dart';
import 'package:e_commerce_fruits_hub/core/widgets/failuer_message.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/fav_user_orders/fav_user_orders_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/favorte_order_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavorteProductsViewBodyBlocConsumer1 extends StatelessWidget {
  const FavorteProductsViewBodyBlocConsumer1({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductsCubit, ProductsState>(
          listener: (context, state) {
            if (state is UpdateProductsSuccess) {
              snakBar(context, 'تم تحديث المنتج بنجاح');
            } else if (state is UpdateProductsfailure) {
              snakBar(context, state.errorMessage);
            }
          },
        ),
      ],
      child: BlocBuilder<FavUserProductsCubit, FavUserProductsState>(
        builder: (context, state) {
          if (state is FavUserProductLoaded) {
            return FavProductsViewBody(products: state.products);
          } else if (state is FavUserProuductsError) {
            return FailuerMessage(errorMessage: state.message);
          }
          return Skeletonizer(
            child: FavProductsViewBody(products: dummyProducts()),
          );
        },
      ),
    );
  }
}
