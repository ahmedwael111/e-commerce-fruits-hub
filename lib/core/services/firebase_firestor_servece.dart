import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_fruits_hub/core/services/database_service.dart';

class FirebaseFirestorService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  @override
  Future<void> addData({
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
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    required String documenId,
  }) async {
    await firestore.collection(path).doc(documenId).update(data);
  }

  @override
  Future<void> addDataToCollectionInDocument({
    required String path,
    required Map<String, dynamic> data,
    required String? documenId,
    required String subCollectionPath,
    required String docIdOfSubCollection,
  }) async {
    await firestore
        .collection(path)
        .doc(documenId)
        .collection(subCollectionPath)
        .doc(docIdOfSubCollection)
        .set(data);
  }

  @override
  Future<void> deleteDataToCollectionInDocument({
    required String path,
    required String? documenId,
    required String subCollectionPath,
    required String docIdOfSubCollection,
  }) async {
    await firestore
        .collection(path)
        .doc(documenId)
        .collection(subCollectionPath)
        .doc(docIdOfSubCollection)
        .delete();
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

  @override
  Stream streamData({
    required String path,
    Map<String, dynamic>? queryParam,
  }) async* {
    //
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
      if (queryParam['isFav'] != null) {
        data = data.where(
          'isFav',
          isEqualTo: queryParam['isFav'],
        ); // filter on spesific element
      }
    }
    await for (var result in data.snapshots()) {
      log('STREAM UPDATE: ${result.docs.length}');

      // 'await for' its insted "listen"  that work with streams using snapshots
      yield result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<dynamic> dataFromCollectionWithInDocument({
    required String path,
    // required Map<String, dynamic> data,
    Map<String, dynamic>? queryParam,
    required String? documenId,
    required String subCollectionPath,
    // required String docIdOfSubCollection,
  }) async {
    Query<Map<String, dynamic>> data = firestore
        .collection(path)
        .doc(documenId)
        .collection(
          subCollectionPath,
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
      if (queryParam['isFav'] != null) {
        data = data.where(
          'isFav',
          isEqualTo: queryParam['isFav'],
        ); // filter on spesific element
      }
    }
    var result = await data.get();
      log('STREAM UPDATE new **: ${result.docs.length}');

      // 'await for' its insted "listen"  that work with streams using snapshots
      return result.docs.map((e) => e.data()).toList();
    }
    
     

  @override
  Future getDataBySearch({
    required String path,
    required String firstFieldName,
    required String secondFieldName,
    required String searchValue,
  }) async {
    Query<Map<String, dynamic>> data = firestore
        .collection(path)
        .orderBy(firstFieldName)
        .orderBy(secondFieldName)
        .startAt([searchValue])
        .endAt(['$searchValue\uf8ff']);
    var requist = await data.get(); // 3) get data with search
    return requist.docs.map((e) => e.data()).toList();
  }
}
