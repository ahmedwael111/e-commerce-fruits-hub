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
      var data =
          await databaseService.getData(
                path: BackendEndpointsStatics.products,
                queryParam: {
                  'orderBy': 'sellingCount',
                  'limit': 10,
                  'desc': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromMap(e).toEntity()).toList();
      return right(products);
    } on Exception catch (e) {
      return left(ServerFailuer('خطاء في الاتصال بقاعدة البيانات'));
    }
  }

  @override
  Future<Either<Failuer, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(path: BackendEndpointsStatics.products)
              as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromMap(e).toEntity()).toList();
      return right(products);
    } on Exception catch (e) {
      return left(ServerFailuer('خطاء في الاتصال بقاعدة البيانات'));
    }
  }
}
