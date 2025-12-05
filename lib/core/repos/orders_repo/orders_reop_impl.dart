import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:e_commerce_fruits_hub/core/services/database_service.dart';
import 'package:e_commerce_fruits_hub/core/utils/backend_endpoints_statics.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/data/models/order_model.dart';
import 'package:e_commerce_fruits_hub/featurs/check%20out/domain/entitys/order_entity.dart';

class OrdersReopImpl implements OrdersRepo {
  final DatabaseService databaseService;

  OrdersReopImpl({required this.databaseService});
  @override
  Future<Either<Failuer, void>> addOrder(OrderEntity orderEntity) async {
    try {
      var orderModel = OrderModel.fromEntity(orderEntity);
      databaseService.saveData(
        path: BackendEndpointsStatics.addOrder,
        documenId: orderModel.orderId, // use order id as document id
        data: orderModel.toJson(),
      ); // there i use order model becuse repo imple used in data layer .
      return Right(null);
    } on Exception catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }
}
