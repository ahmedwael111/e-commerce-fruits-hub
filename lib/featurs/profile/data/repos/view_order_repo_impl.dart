import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/core/helper_functions.dart/get_user_data_from_prefs.dart';
import 'package:e_commerce_fruits_hub/core/services/database_service.dart';
import 'package:e_commerce_fruits_hub/core/utils/backend_endpoints_statics.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/data/models/order_model.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/order_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/view_orders_repo.dart';

class ViewOrderRepoImpl implements ViewOrdersRepo {
  final DatabaseService databaseService;

  ViewOrderRepoImpl({required this.databaseService});
  @override
  Stream<Either<Failuer, List<OrderEntityForOrderForOrders>>>
  viewOrders() async* {
    try {
      await for (var data in databaseService.streamData(
        // there i make listening " await for" to stream as i doing in data Survice
        path: BackendEndpointsStatics.getOrders,
      )) {
        List<OrderEntityForOrderForOrders> ordersData =
            (data as List<dynamic>)
                .map((e) => OrderModelForOrders.fromJson(e).toEntity())
                .toList();
        List<OrderEntityForOrderForOrders> userOrders =
            []; // filtering orders for the current user only
        for (var order in ordersData) {
          if (order.uId == getUserDataFromPrefs().id) {
            userOrders.add(order);
          }
        }

        yield right(userOrders);
      }
    } catch (e) {
      log('eviewOrders ViewOrderRepoImpl : ${e.toString()}');
      yield left(ServerFailuer('filed to get orders'));
    }
  }

  // @override
  // Future<Either<Failuer, void>> updateOrderStatus({required String orderId, required OrderStatesEnum status}) async { // updating in firebase by change the element that you want changer it only .
  //   try {
  //     return databaseService
  //         .updateData(path: BackendEndpointsStatics.updateOrders, data: {'state': status.name}, documenId: orderId)
  //         .then((value) => right(null));
  //   } catch (e) {
  //     log('updateOrderStatus ViewOrderRepoImpl : ${e.toString()}');
  //     return left( ServerFailuer('filed to update order status'));
  //   }
  // }
}
