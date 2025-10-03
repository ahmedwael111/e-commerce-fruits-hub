import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_fruits_hub/constants.dart';
import 'package:e_commerce_fruits_hub/core/errors/exeptions.dart';
import 'package:e_commerce_fruits_hub/core/errors/failuer.dart';
import 'package:e_commerce_fruits_hub/core/services/database_service.dart';
import 'package:e_commerce_fruits_hub/core/services/firebase_auth_service.dart';
import 'package:e_commerce_fruits_hub/core/services/shared_prefrenseces_singleton.dart';
import 'package:e_commerce_fruits_hub/core/utils/backend_endpoints_statics.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/data/models/user_model.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImplementation implements AuthRepo {
  final FirebaseAuthService _firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImplementation({
    required this.databaseService,
    required FirebaseAuthService firebaseAuthService,
  }) : _firebaseAuthService = firebaseAuthService;
  @override
  Future<Either<ServerFailuer, UserEntity>> creatUserEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await _firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      var userEntity = UserEntity(id: user.uid, name: name, email: email);

      await addUser(user: userEntity); // add user to database
      return right(userEntity);
    } on CoustomException catch (e) {
      if (user != null) {
        await _firebaseAuthService
            .deleteUser(); // delete user from firebase auth if there is an error
      }
      log(
        'exeption in AuthRepoImplementation.creatUserEmailAndPassword: ${e.message}',
      );
      return left(ServerFailuer(e.message));
    } catch (e) {
      if (user != null) {
        await _firebaseAuthService
            .deleteUser(); // delete user from firebase auth if there is an error
      }
      log(
        'exeption in AuthRepoImplementation.creatUserEmailAndPassword: ${e.toString()}',
      );
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
      var userEntity = await getUserData(uid: (await user).uid); // get user data from database
       saveUserDataToLocalPrefs(user: userEntity); // save user data to local prefs
      return right(userEntity);
    } on CoustomException catch (e) {
      log(
        'exeption in AuthRepoImplementation.signInWithEmailAndPassword: ${e.message}',
      );
      return left(ServerFailuer(e.message));
    } catch (e) {
      log(
        'exeption in AuthRepoImplementation.signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailuer('خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<ServerFailuer, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await _firebaseAuthService.signInWithGoogle();
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      bool isUserExist = await databaseService.checkIfDataExist(
        path: BackendEndpointsStatics.users,
        documenId: user!.uid,
      );
      if (isUserExist) {
        userEntity = await getUserData(
          uid: user.uid,
        ); // get user from database if exist
      } else {
        await addUser(user: userEntity); // add user to database
        userEntity = await getUserData(
          uid: user.uid,
        ); // get user from database after adding
      }
      return right(userEntity);
    } on CoustomException catch (e) {
      if (user != null) {
        await _firebaseAuthService
            .deleteUser(); // delete user from firebase auth if there is an error
      }
      log('exeption in AuthRepoImplementation.signInWithGoogle: ${e.message}');
      return left(ServerFailuer(e.message));
    } catch (e) {
      if (user != null) {
        await _firebaseAuthService
            .deleteUser(); // delete user from firebase auth if there is an error
      }
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

  @override
  Future addUser({required UserEntity user}) async {
    await databaseService.saveData(
      path: BackendEndpointsStatics.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documenId: user.id,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async { // get user from database : now why not from local prefs : because user may login from another device , but when he try to login from another device the data will be fetched from database and saved to local prefs
    var userData = await databaseService.getData(
      path: BackendEndpointsStatics.getUserData,
      documenId: uid,
    );
    return UserModel.fromMap(userData);
  }

  @override
  saveUserDataToLocalPrefs({required UserEntity user}) { // save user data to local prefs as json string
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    Prefs.setString(kUserDataKey, jsonData);
  }
}
