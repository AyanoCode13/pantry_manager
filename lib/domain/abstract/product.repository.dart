import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/utils/result.dart';

abstract class ProductRepository {
  Future<Result<void>> add(ProductEntity product);
  Future<Result<void>> update(ProductEntity product);
  Future<Result<void>> delete(String id);
  Future<Result<List<ProductEntity>>> getAll();
  Future<Result<ProductEntity>> getById(String id);
}