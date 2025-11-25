import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failuer, void>> addOrder(
    OrderEntity orderEntity,
  ); // order entity used in repo that should be used in Domain layer
}
