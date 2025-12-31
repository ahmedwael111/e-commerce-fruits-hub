import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/order_entity.dart';

abstract class ViewOrdersRepo {
  Stream<Either<Failuer, List<OrderEntityForOrderForOrders>>> viewOrders();
  // Future<Either<Failuer, void>> updateOrderStatus(
  //     {required String orderId, required OrderStatesEnum status}
  // );
}
