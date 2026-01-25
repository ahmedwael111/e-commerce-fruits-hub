import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/fav_user_orders_repo.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/presentation/manager/stream_for_fav_user_products_cubit/stream_for_fav_user_products_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fav_user_orders_state.dart';

class FavUserProductsEditsCubit extends Cubit<FavUserOrdersState> {
  FavUserProductsEditsCubit(this.favUserOrdersRepo)
    : super(AddFavUserOrdersInitial());

  final FavUserOrdersRepo favUserOrdersRepo;

  void toggleFav(ProductEntity productEntity, BuildContext context) {
    if (context.read<StreamForFavUserProductsCubit>().favUserProducts != null &&
        context.read<StreamForFavUserProductsCubit>().favUserProducts!.contains(
          productEntity,
        )) {
      deleteFavUserOrders(productEntity);
    } else {
      addFavUserOrders(productEntity);
    }
  }

  Future<void> addFavUserOrders(ProductEntity productEntity) async {
    emit(AddFavUserOrdersloading());
    final result = await favUserOrdersRepo.addFavUserOrders(productEntity);
    result.fold(
      (l) => emit(AddFavUserOrdersFaulier(errMessage: l.errMessage)),
      (r) => emit(AddFavUserOrdersSuccess()),
    );
  }

  Future<void> deleteFavUserOrders(ProductEntity productEntity) async {
    emit(DeleteFavUserOrdersloading());
    final result = await favUserOrdersRepo.deleteFavUserOrders(productEntity);
    result.fold(
      (l) => emit(DeleteFavUserOrdersFaulier(errMessage: l.errMessage)),
      (r) => emit(DeleteFavUserOrdersSuccess()),
    );
  }
}
