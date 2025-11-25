import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_fruits_hub/core/services/database_service.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/data/models/user_model.dart';
import 'package:e_commerce_fruits_hub/featurs/auth/domain/entities/user_entity.dart';

class FirebaseFirestorService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  @override
  Future<void> saveData({
    required String path,
    required Map<String, dynamic> data,
    String? documenId,
  }) async {
    if (documenId == null) {
      await firestore.collection(path).add(data);
    } else {
      await firestore.collection(path).doc(documenId).set(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documenId,
    Map<String, dynamic>? queryParam,
  }) async {
    // edit method to return date for one entity or list of entities
    if (documenId != null) {
      var requist = await firestore.collection(path).doc(documenId).get();
      return requist.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(
        path,
      ); // get list with filetration from firestore
      if (queryParam != null) {
        if (queryParam['orderBy'] != null) {
          // 1) filtration befor 'get' data
          data = data.orderBy(
            queryParam['orderBy'],
            descending: queryParam['desc'],
          );
        }
        if (queryParam['limit'] != null) {
          // 2) filtration befor 'get' data
          data = data.limit(queryParam['limit']);
        }
      }
      var requist = await data.get(); // 3) get data
      return requist.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExist({
    required String path,
    required String documenId,
  }) {
    var doc = firestore.collection(path).doc(documenId).get();
    return doc.then((value) => value.exists);
  }
}
