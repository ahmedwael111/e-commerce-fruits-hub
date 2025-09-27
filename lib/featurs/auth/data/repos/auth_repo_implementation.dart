import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/core/errors/exeptions.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/core/services/firebase_auth_service.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/data/models/user_model.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      return left(ServerFailuer('خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<ServerFailuer, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = _firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(await user));
    } on CoustomException catch (e) {
      log(
        'exeption in AuthRepoImplementation.signInWithEmailAndPassword: ${e.message}',
      );
      return left(ServerFailuer(e.message));
    } catch (e) {
      return left(ServerFailuer('خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<ServerFailuer, UserEntity>> signInWithGoogle() async {
    try {
      var user = _firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(await user));
    } on CoustomException catch (e) {
      log('exeption in AuthRepoImplementation.signInWithGoogle: ${e.message}');
      return left(ServerFailuer(e.message));
    } catch (e) {
      log(
        'exeption in AuthRepoImplementation.signInWithGoogle: ${e.toString()}',
      );
      return left(ServerFailuer('خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<ServerFailuer, UserEntity>> signInWithFacebook() async {
    try {
      var user = _firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(await user));
    } on CoustomException catch (e) {
      log(
        'exeption in AuthRepoImplementation.signInWithFacebook: ${e.message}',
      );
      return left(ServerFailuer(e.message));
    } catch (e) {
      log(
        'exeption in AuthRepoImplementation.signInWithFacebook: ${e.toString()}',
      );
      return left(ServerFailuer('خطأ غير متوقع'));
    }
  }
}
