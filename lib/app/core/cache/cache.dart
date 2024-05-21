abstract class Cache {
  Future<bool> insert(String table, Map<String, Object> query);
  Future<bool> update(String table, int id, Map<String, Object> query);
  Future<bool> delete(String table, int id);
  Future<bool> get(String table, Map<String, Object> query);
}
