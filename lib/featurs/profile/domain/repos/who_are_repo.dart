import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/who_are_entity.dart';

abstract class WhoAreRepo {
  Future<Either<Failuer, WhoAreEntity>> getHowAre();
}
