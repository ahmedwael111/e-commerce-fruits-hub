import 'package:e_commerce_fruits_hub/core/cubits/products/products_cubit.dart';
import 'package:e_commerce_fruits_hub/core/helper_functions.dart/dummy_products.dart';
import 'package:e_commerce_fruits_hub/core/widgets/failuer_message.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/fav_user_orders/fav_user_orders_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/fetch_orders/fetch_orders_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/stream_for_fav_user_products_cubit/stream_for_fav_user_products_cubit.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/views/widgets/favorte_order_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavortaOrderViewBodyBlocConsumer1 extends StatelessWidget {
  const FavortaOrderViewBodyBlocConsumer1({super.key});

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
        BlocListener<FavUserProductsEditsCubit, FavUserOrdersState>(
          listener: (context, state) {
            if (state is AddFavUserOrdersSuccess) {
              snakBar(context, 'تم ائضافة المنتج الى المفضلة بنجاح');
            }
            if (state is AddFavUserOrdersFaulier) {
              snakBar(context, state.errMessage);
            }
            if (state is DeleteFavUserOrdersSuccess) {
              snakBar(context, 'تم حذف المنتج من المفضلة بنجاح');
            }
            if (state is DeleteFavUserOrdersFaulier) {
              snakBar(context, state.errMessage);
            }
          },
        ),
      ],
      child: BlocBuilder<
        StreamForFavUserProductsCubit,
        StreamForFavUserProductsState
      >(
        // bloc builder for 'FavUserOrdersCubit' for 'fetchFavUserOrders' stream
        builder: (context, state) {
          if (state is StreamForFavUserProductsSuccess) {
            return FavOrdersViewBody(products: state.products);
          } else if (state is StreamForFavUserProductsFaulier) {
            return FailuerMessage(errorMessage: state.errMessage);
          } else {
            return Skeletonizer(
              child: FavOrdersViewBody(products: dummyProducts()),
            );
          }
        },
      ),
    );
    // );
  }
}
