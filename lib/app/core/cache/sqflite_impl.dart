import 'dart:async';

import 'package:dicionario/app/core/cache/cache.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteImpl implements Cache {
   Database? _database;

  SqfliteImpl() {
    initDB();
    //removeDB();
  }

  Future removeDB() async {
    await deleteDatabase("dictionary_db");
  }

  Future initDB() async {

    

bool exists = await databaseExists("dictionary_db");

if (!exists) {
  _database = await openDatabase("dictionary_db", onCreate: (db, version) {
    db.execute(
      'CREATE TABLE works('
      'id INTEGER PRIMARY KEY, '
      'script TEXT, '
      'favorite INTEGER)',
    );
  }, version: 1);
}

_database = await openDatabase("dictionary_db");
  }

  @override
  Future<bool> delete(String table, int id) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(String table, Map<String, Object> query) async {
    await _database!.insert(table, query);
    return true;
  }

  @override
  Future<bool> update(String table, int id, Map<String, Object> query) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, Object?>>> get(String table, Map<String, Object> query) async {
    return await _database!.query('works');
  }
}
