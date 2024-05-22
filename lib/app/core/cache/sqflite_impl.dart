import 'package:dicionario/app/core/cache/cache.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteImpl implements Cache {
  static final SqfliteImpl _instance = SqfliteImpl._internal();

  factory SqfliteImpl() {
    return _instance;
  }

  SqfliteImpl._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'dictionary.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE works (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        script TEXT,
        favorite INT
      )
    ''');
  }

  @override
  Future<List<Map<String, Object?>>> get(
      String key, String where, List<Object?> whereArgs) async {
    final db = await database;
    return await db.query(key, where: where, whereArgs: whereArgs);
  }

  @override
  Future<bool> insert(String key, Map<String, Object?> value) async {
    final db = await database;
    await db.insert(key, value);
    return true;
  }

  @override
  Future<bool> update(String key, Map<String, Object?> value, String where,
      List<Object?> whereArgs) async {
    final db = await database;
    await db.update(
      key,
      value,
      where: where,
      whereArgs: whereArgs,
    );
    return true;
  }

  @override
  Future<bool> remove(String key, String where, List<Object?> whereArgs) async {
    final db = await database;
    await db.delete(
      key,
      where: where,
      whereArgs: whereArgs,
    );
    return true;
  }
}
