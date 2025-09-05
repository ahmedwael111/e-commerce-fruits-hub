import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/errors/exeptions.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/core/services/firebase_auth_service.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/data/entities/user_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/data/models/user_model.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepoImplementation({required FirebaseAuthService firebaseAuthService})
    : _firebaseAuthService = firebaseAuthService;
  @override
  Future<Either<ServerFailuer, UserEntity>> creatUserEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var user = _firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      return right(UserModel.fromFirebaseUser(await user));
    } on CoustomException catch (e) {
      log(
        'exeption in AuthRepoImplementation.creatUserEmailAndPassword: ${e.message}',
      );
      return left(ServerFailuer(e.message));
    } catch (e) {
      return left(ServerFailuer('An unexpected error occurred'));
    }
  }
}
