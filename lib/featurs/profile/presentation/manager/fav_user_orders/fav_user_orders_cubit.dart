import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/fav_user_orders_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fav_user_orders_state.dart';

class FavUserProductsCubit extends Cubit<FavUserProductsState> {
  FavUserProductsCubit(this.favUserOrdersRepo)
    : super(FavUserProductsInitial());

  final FavUserOrdersRepo favUserOrdersRepo;

  List<ProductEntity> _favProducts = [];

  // List<ProductEntity> get favProducts => _favProducts;

  Future<void> fetchFavUserProducts() async {
    final result = await favUserOrdersRepo.fetchFavUserProducts();

    result.fold((l) => emit(FavUserProuductsError(l.errMessage)), (r) {
      _favProducts = r;
      emit(FavUserProductLoaded(List.from(_favProducts)));
    });
  }

  Future<void> toggleFav(ProductEntity product) async {
    final isFav = _favProducts.any((p) => p.productId == product.productId);

    if (isFav) {
      final result = await favUserOrdersRepo.deleteFavUserProduct(product);

      result.fold((l) => emit(FavUserProuductsError(l.errMessage)), (_) {
        _favProducts.removeWhere((p) => p.productId == product.productId);
        emit(FavUserProductLoaded(List.from(_favProducts)));
      });
    } else {
      final result = await favUserOrdersRepo.addFavUserProducts(product);

      result.fold((l) => emit(FavUserProuductsError(l.errMessage)), (_) {
        _favProducts.add(product);
        emit(FavUserProductLoaded(List.from(_favProducts)));
      });
    }
  }

  bool isFavorite(String productId) {
    return _favProducts.any((p) => p.productId == productId);
  }
}
