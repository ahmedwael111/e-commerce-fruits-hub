import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';

abstract class FavUserOrdersRepo {
  Future<Either<Failuer, void>> addFavUserProducts(ProductEntity productEntity);
  Future<Either<Failuer, void>> deleteFavUserProduct(
    ProductEntity productEntity,
  );
  Future<Either<Failuer, List<ProductEntity>>> fetchFavUserProducts();
}
