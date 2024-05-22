abstract class Cache {
  Future<List<Map<String, Object?>>> get(
      String key, String where, List<Object?> whereArgs);
  Future<bool> insert(String key, Map<String, Object?> value);
  Future<bool> update(String key, Map<String, Object?> value, String where,
      List<Object?> whereArgs);
  Future<bool> remove(String key, String where, List<Object?> whereArgs);
}
