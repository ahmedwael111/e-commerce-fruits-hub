import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  // abstraction of AuthRepo  or repository pattern or interface
  Future<Either<ServerFailuer, UserEntity>> creatUserEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future addUser({ required UserEntity user}); // adding user to database
  Future<Either<ServerFailuer, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<UserEntity> getUserData({ required String uid});
  Future<Either<ServerFailuer, UserEntity>> signInWithGoogle();
  Future<Either<ServerFailuer, UserEntity>> signInWithFacebook();
}
