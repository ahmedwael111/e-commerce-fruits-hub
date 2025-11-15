import 'package:bloc/bloc.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';
import 'package:equatable/equatable.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());
  final OrdersRepo ordersRepo;

  Future<void> addOrder(OrderEntity orderEntity) async {
    emit(AddOrderLoading());
    final result = await ordersRepo.addOrder(orderEntity);
    result.fold((l) => emit(AddOrderFailure(l)), (r) => emit(AddOrderSuccess()));
  }
}
