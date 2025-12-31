import 'dart:async';

import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/order_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/view_orders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.viewOrdersRepo) : super(FetchOrdersInitial());
  final ViewOrdersRepo viewOrdersRepo;
  StreamSubscription?
  streamSubscription; // to cancel the stream when not needed to avoid memory leak its name 'reference'
  void fetchOrders() async {
    emit(FetchOrdersLoading());
    streamSubscription = viewOrdersRepo.viewOrders().listen((data) {
      data.fold(
        (f) {
          emit(FetchOrdersFailure(errorMessage: f.toString()));
        },
        (r) {
          emit(FetchOrdersSuccess(orders: r));
        },
      );
    });
    //   // i make a listening on stream using  " await for " also i make in data servive and impl

    // await for (var data in viewOrdersRepo.viewOrders()) {  // i make a listening on stream using  " await for " also i make in data servive and impl
    //   data.fold(
    //     (f) {
    //       emit(FetchOrdersFailure(errorMessage: f.toString()));
    //     },
    //     (r) {
    //       emit(FetchOrdersSuccess(orders: r));
    //     },
    //   );
    // }
  }

  @override
  Future<void> close() {
    streamSubscription
        ?.cancel(); // to cancel the stream when not needed to avoid memory leak
    return super.close();
  }
}
