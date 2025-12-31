// import 'package:bloc/bloc.dart';
// import 'package:fruits_hub_dashboard/core/utils/order_states.dart';
// import 'package:fruits_hub_dashboard/featurs/view_orders/domain/repos/view_orders_repo.dart';
// import 'package:meta/meta.dart';

// part 'update_order_state.dart';

// class UpdateOrderCubit extends Cubit<UpdateOrderState> {
//   UpdateOrderCubit(this.viewOrdersRepo) : super(UpdateOrderInitial());
//   final ViewOrdersRepo viewOrdersRepo;

//   void updateOrder(OrderStatesEnum status,  String orderId) async {
//     emit(UpdateOrderLoading());
//     var data = await viewOrdersRepo.updateOrderStatus(
//       orderId: orderId,
//       status: status,
//     );
//     data.fold(
//         (f) {
//           emit(UpdateOrderfaulier(errMessage: f.toString()));
//         },
//         (r) {
//           emit(UpdateOrderSuccess());
//         },
//       );
      
//   }
// }
