import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/core/models/product_model.dart';
import 'package:e_commerce_fruits_hub/core/repos/products_repo.dart';
import 'package:e_commerce_fruits_hub/core/services/database_service.dart';
import 'package:e_commerce_fruits_hub/core/utils/backend_endpoints_statics.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});
  @override
  Future<Either<Failuer, List<ProductEntity>>> getPestSellingProducts() async {
    try {
      var data = await databaseService.getData(
        path: BackendEndpointsStatics.addproducts,
        queryParam: {'sellingCount': 'asc'},
      );
      List<ProductEntity> products =
          (data as List<Map<String, dynamic>>)
              .map((e) => ProductModel.fromMap(e).toEntity())
              .toList();
      return right(products);
    } on Exception {
      return left(ServerFailuer('خطاء في الاتصال بقاعدة البيانات'));
    }
  }

  @override
  Future<Either<Failuer, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
        path: BackendEndpointsStatics.addproducts,
      );
      List<ProductEntity> products =
          (data as List<Map<String, dynamic>>)
              .map((e) => ProductModel.fromMap(e).toEntity())
              .toList();
      return right(products);
    } on Exception {
      return left(ServerFailuer('خطاء في الاتصال بقاعدة البيانات'));
    }
  }

  @override
  Future<Either<Failuer, ProductEntity>> updateProduct(
    ProductEntity productEntity,
  ) async {
    try {
      var productModel = ProductModel.fromEntity(productEntity);

      await databaseService.updateData(
        path: BackendEndpointsStatics.updateproducts,
        documenId: productModel.productId,
        data: {
          // 'isFav': productModel.isFav == true ? false : true
        },
      );
      var updatedProductEntity =
          productModel.toEntity(); // update productEntity

      return right(updatedProductEntity);
    } on Exception catch (e) {
      log(' products repo impl  in updateProduct: ${e.toString()}');
      return left(ServerFailuer('خطاء في الاتصال بقاعدة البيانات'));
    }
  }

  @override
  Future<Either<Failuer, List<ProductEntity>>> getDataWithSearch({
    required String searchValue,
  }) async {
    try {
      var data = await databaseService.getDataBySearch(
        path: BackendEndpointsStatics.addproducts,
        firstFieldName: 'name',
        secondFieldName: 'description',
        searchValue: searchValue,
      );
      List<ProductEntity> products =
          (data as List<Map<String, dynamic>>)
              .map((e) => ProductModel.fromMap(e).toEntity())
              .toList();
      return right(products);
    } on Exception catch (e) {
      log(' products repo impl  in getDataWithSearch: ${e.toString()}');
      return left(ServerFailuer('خطاء في الاتصال بقاعدة البيانات'));
    }
  }
}
