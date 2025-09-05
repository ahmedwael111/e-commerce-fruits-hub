import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/data/entities/user_entity.dart';

abstract class AuthRepo {     // abstraction of AuthRepo  or repository pattern or interface
  Future<Either<ServerFailuer, UserEntity>> creatUserEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
}
