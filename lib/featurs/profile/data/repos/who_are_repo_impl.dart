import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/core/services/database_service.dart';
import 'package:e_commerce_fruits_hub/core/utils/backend_endpoints_statics.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/data/models/who_are_model.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/who_are_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/repos/who_are_repo.dart';

class WhoAreRepoImpl implements WhoAreRepo {
  final DatabaseService databaseService;

  WhoAreRepoImpl({required this.databaseService});

  @override
  Future<Either<Failuer, WhoAreEntity>> getHowAre() async {
    try {
      var data =
          await databaseService.getData(
                path: BackendEndpointsStatics.whoAre,
                documenId: '0SWu4zJI6fFbeISaRyty',// this is the document id of who are data in firebase
              )
              as Map<String, dynamic>;

      var data2 = WhoAreModel.fromJson(data).toEntity();
      return right(data2);
    } catch (e) {
      log('eviewOrders ViewOrderRepoImpl : ${e.toString()}');
      return left(ServerFailuer('filed to get orders'));
    }
  }
}
