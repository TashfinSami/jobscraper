import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TLocalStorage {
  late final Database _database;
  late final StoreRef _store;

  static TLocalStorage? _instance;

  TLocalStorage._internal();

  factory TLocalStorage.instance() {
    _instance ??= TLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String dbName) async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    var dbPath = join(dir.path, '$dbName.db');
    final db = await databaseFactoryIo.openDatabase(dbPath);
    _instance = TLocalStorage._internal();
    _instance!._database = db;
    _instance!._store = stringMapStoreFactory.store();
  }

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _store.record(key).put(_database, value);
  }

  // Generic method to read data
  Future<T?> readData<T>(String key) async {
    final snapshot = await _store.record(key).get(_database);
    return snapshot as T?;
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _store.record(key).delete(_database);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _store.delete(_database);
  }
}
