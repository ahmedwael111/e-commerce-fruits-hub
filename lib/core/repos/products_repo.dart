import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';

abstract class ProductsRepo {
  Future<Either<Failuer, List<ProductEntity>>> getProducts();
  Future<Either<Failuer, List<ProductEntity>>>
  getPestSellingProducts(); // ALL products with filteration
}
