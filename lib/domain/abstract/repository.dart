import 'package:meal_planner/utils/result.dart';

abstract class Repository<T> {
  Future<Result<void>> add(T input);
  Future<Result<void>> update(T input);
  Future<Result<void>> delete(String id);
  Future<Result<List<T>>> getAll();
  Future<Result<T>> getById(String id);
}