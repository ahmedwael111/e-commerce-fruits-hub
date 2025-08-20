import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/data/entities/user_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  @override
  Future<Either<ServerFailuer, UserEntity>> creatUserEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
