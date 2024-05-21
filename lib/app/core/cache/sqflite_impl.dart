import 'package:dicionario/app/core/cache/cache.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteImpl implements Cache {
  late final Database _database;

  SqfliteImpl() {
    initDb();
  }

  Future initDb() async {
    bool exists = await databaseExists("dictionary_db");

    if (!exists) {
      print('O banco de dados está sendo criado.');

      _database = await openDatabase("dictionary_db", onCreate: (db, version) {
        db.execute(
          'CREATE TABLE works('
          'id INTEGER PRIMARY KEY, '
          'script TEXT, '
          'favorite INTEGER)',
        );
      }, version: 1);
    }

    print('O banco de dados já existe');
    _database = await openDatabase("dictionary_db");
  }

  @override
  Future<bool> delete(String table, int id) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(String table, Map<String, Object> query) async {
    await _database.insert(table, query);
    return true;
  }

  @override
  Future<bool> update(String table, int id, Map<String, Object> query) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<bool> get(String table, Map<String, Object> query) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
