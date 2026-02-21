import 'package:meal_planner/data/local/dao/product.dao.dart';
import 'package:meal_planner/domain/abstract/product.repository.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/utils/result.dart';

final class LocalProductRepository  implements ProductRepository {
  final ProductDAO _productDAO;

  LocalProductRepository({required ProductDAO productDAO}) : _productDAO = productDAO;

  @override
  Future<Result<void>> add(ProductEntity product) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<List<ProductEntity>>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Result<ProductEntity>> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> update(ProductEntity product) {
    // TODO: implement update
    throw UnimplementedError();
  }
  

}