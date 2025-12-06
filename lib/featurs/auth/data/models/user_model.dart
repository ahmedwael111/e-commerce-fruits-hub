import 'package:e_commerce_fruits_hub/featurs/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  // this model for operation with firebase
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.imageUrl,
  });
  factory UserModel.fromFirebaseUser(User? user) {
    return UserModel(
      id: user!.uid,
      imageUrl: user.photoURL ?? '',
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
    );
  }
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      imageUrl: map['imageUrl'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email, 'imageUrl': imageUrl};
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      imageUrl: user.imageUrl,
    );
  }
}
