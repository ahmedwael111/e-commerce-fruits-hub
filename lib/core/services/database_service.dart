import 'package:e_commerce_fruits_hub/featurs/auth/domain/entities/user_entity.dart';

abstract class DatabaseService {
  // abstraction of database consumer'rapper'
  Future<void> saveData({
    required String path,
    required Map<String, dynamic> data,
    String? documenId,
  });
  Future<dynamic> getData({
    required String path,
    String? documenId,
    Map<String, dynamic>? queryParam,
  });
  Future<bool> checkIfDataExist({
    required String path,
    required String documenId,
  });
}
