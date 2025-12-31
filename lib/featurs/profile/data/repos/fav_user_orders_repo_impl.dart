import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/entities/product_entity.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/core/helper_functions.dart/get_user_data_from_prefs.dart';
import 'package:e_commerce_fruits_hub/core/models/product_model.dart';
import 'package:e_commerce_fruits_hub/core/services/database_service.dart';
import 'package:e_commerce_fruits_hub/core/utils/backend_endpoints_statics.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/fav_user_orders_repo.dart';

class FavUserOrdersRepoImpl implements FavUserOrdersRepo {
  final DatabaseService databaseService;
  FavUserOrdersRepoImpl({required this.databaseService});
  @override
  Future<Either<Failuer, void>> addFavUserOrders(
    ProductEntity productEntity,
  ) async {
    try {
      var productModel = ProductModel.fromEntity(productEntity);
      await databaseService.addDataToCollectionInDocument(
        path: BackendEndpointsStatics.users,
        documenId: getUserDataFromPrefs().id,
        subCollectionPath: BackendEndpointsStatics.favUserOrders,
        docIdOfSubCollection: productModel.productId,
        data: productModel.toMap(),
      );
      return right(null);
    } catch (e) {
      log('eviewOrders ViewOrderRepoImpl : ${e.toString()}');
      return left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, void>> deleteFavUserOrders(
    ProductEntity productEntity,
  ) async {
    try {
      var productModel = ProductModel.fromEntity(productEntity);
      await databaseService.deleteDataToCollectionInDocument(
        path: BackendEndpointsStatics.users,
        documenId: getUserDataFromPrefs().id,
        subCollectionPath: BackendEndpointsStatics.favUserOrders,
        docIdOfSubCollection: productModel.productId,
      );
      return right(null);
    } catch (e) {
      log('eviewOrders ViewOrderRepoImpl : ${e.toString()}');
      return left(ServerFailuer(e.toString()));
    }
  }

  @override
  Stream<Either<Failuer, List<ProductEntity>>> fetchFavUserOrders() async* {
    try {
      await for (var data in databaseService.streamDataFromCollectionWithInDocument(
        path: BackendEndpointsStatics.users,
        documenId: getUserDataFromPrefs().id,
        subCollectionPath: BackendEndpointsStatics.favUserOrders,
       
      )) {
        // var data1 = data as List<Map<String, dynamic>>;
        List<ProductEntity> products =
            (data as List<Map<String, dynamic>>).map((e) => ProductModel.fromMap(e).toEntity()).toList();
        yield right(products);
      }
    } catch (e) {
      log('eviewOrders ViewOrderRepoImpl : ${e.toString()}');
      yield left(ServerFailuer(e.toString()));
    }
  }
}
