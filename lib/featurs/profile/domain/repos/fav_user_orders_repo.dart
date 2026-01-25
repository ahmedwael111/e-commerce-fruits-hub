import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';

abstract class FavUserOrdersRepo {
  Future<Either<Failuer, void>> addFavUserOrders(ProductEntity productEntity);
  Future<Either<Failuer, void>> deleteFavUserOrders(
    ProductEntity productEntity,
  );
  Stream<Either<Failuer, List<ProductEntity>>> fetchFavUserOrders();
}
