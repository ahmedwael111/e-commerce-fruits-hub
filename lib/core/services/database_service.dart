
abstract class DatabaseService {
  // abstraction of database consumer'rapper'
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documenId,
  });
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    required String documenId,
  });
  Future<void> addDataToCollectionInDocument({
    required String path,
    required Map<String, dynamic> data,
    required String? documenId,
    required String subCollectionPath,
    required String docIdOfSubCollection,
  });
  Future<void> deleteDataToCollectionInDocument({
    required String path,
    // required Map<String, dynamic> data,
    required String? documenId,
    required String subCollectionPath,
    required String docIdOfSubCollection,
  });
  Future<dynamic> getData({
    required String path,
    String? documenId,
    Map<String, dynamic>? queryParam,
  });
  Future<dynamic> getDataBySearch({
    required String path,
    required String firstFieldName,
    required String secondFieldName,
    required String searchValue,
  });
  Stream<dynamic> streamData({
    required String path,
    // String? documenId,
    Map<String, dynamic>? queryParam,
  });
  Future<dynamic> dataFromCollectionWithInDocument({
    required String path,
    // required Map<String, dynamic> data,
    required String? documenId,
    required String subCollectionPath,
    // required String docIdOfSubCollection,
    Map<String, dynamic>? queryParam,
  });
  Future<bool> checkIfDataExist({
    required String path,
    required String documenId,
  });
}
