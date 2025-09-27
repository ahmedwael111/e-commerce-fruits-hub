import 'package:e_commerce_fruits_hub/featurs/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  // this model for operation with firebase
  UserModel({required super.id, required super.name, required super.email});
  factory UserModel.fromFirebaseUser(User? user) {
    return UserModel(
      id: user!.uid,
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
    );
  }
}
