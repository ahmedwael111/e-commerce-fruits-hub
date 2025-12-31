import 'package:e_commerce_fruits_hub/core/cubits/products/product_updates_cubit/product_updats_cubit_cubit.dart';
import 'package:e_commerce_fruits_hub/core/widgets/coustom_progress_indicator.dart';
import 'package:e_commerce_fruits_hub/core/widgets/failuer_message.dart';
import 'package:e_commerce_fruits_hub/core/widgets/snake_bar.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/fav_user_orders/fav_user_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:skeletonizer/skeletonizer.dart';

class MultiBlocListenerForProductsUpdates extends StatelessWidget {
  const MultiBlocListenerForProductsUpdates({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FavUserProductsEditsCubit, FavUserOrdersState>(
          listener: (context, state) {
            if (state is AddFavUserOrdersSuccess) {
              snakBar(context, 'تم أضافة المنتج إلى المفضلة ');
            }
            if (state is AddFavUserOrdersFaulier) {
              snakBar(context, state.errMessage);
            }
            if (state is DeleteFavUserOrdersSuccess) {
              snakBar(context, 'تم حذف المنتج من المفضلة ');
            }
            if (state is DeleteFavUserOrdersFaulier) {
              snakBar(context, state.errMessage);
            }
          },
        ),
        BlocListener<ProductUpdatsCubitCubit, ProductUpdatsCubitState>(
          listener: (context, state) {
            if (state is ProductUpdatsCubitSuccess) {
              snakBar(context,  'تم التحديث  بنجاح ');
            }
            if (state is ProductUpdatsCubitFailure) {
              snakBar(context, state.errorMessage);
            }
          },
        ),
      ],
      child: child,
    );
  }
}
