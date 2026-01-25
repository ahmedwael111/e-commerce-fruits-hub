import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/fav_user_orders_repo.dart';
import 'package:equatable/equatable.dart';

part 'stream_for_fav_user_products_state.dart';
 

class StreamForFavUserProductsCubit
    extends Cubit<StreamForFavUserProductsState> {
  StreamForFavUserProductsCubit(this.favUserOrdersRepo)
    : super(StreamForFavUserProductsInitial());
  final FavUserOrdersRepo favUserOrdersRepo;
  StreamSubscription?
  streamSubscription; // to cancel the stream when not needed to avoid memory leak its name 'reference'
 List<ProductEntity>? favUserProducts ;
  void fetchFavUserOrders() async {
    emit(StreamForFavUserProductsloading());
    streamSubscription = favUserOrdersRepo
        .fetchFavUserOrders() // make listner insted 'await for'
        .listen((event) {
          event.fold(
            (f) {
              emit(StreamForFavUserProductsFaulier(errMessage: f.errMessage));
            },
            (r) {
              emit(StreamForFavUserProductsSuccess(products: r));
              favUserProducts = r;
            },
          );
        });
  }

  @override
  Future<void> close() {
    streamSubscription
        ?.cancel(); // to cancel the stream when not needed to avoid memory leak
    return super.close();
  }
}
