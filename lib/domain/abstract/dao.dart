abstract class DAO<T> {
  Future<List<T>> findAll();
  Future<T?> findById(String id);
  Future<void> insert(T item);
  Future<void> update(T item);
  Future<void> delete(String id);
}