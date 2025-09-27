abstract class DatabaseService { // abstraction of database consumer'rapper'
  Future<void> saveData(String path, Map<String, dynamic> data);
}