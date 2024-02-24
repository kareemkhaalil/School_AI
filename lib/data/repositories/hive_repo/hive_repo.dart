abstract class HiveRepo {
  Future<void> put(String key, String data);
  String? get(String key);
  Future<void> delete(String key);
}
