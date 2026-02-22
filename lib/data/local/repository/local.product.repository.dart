import 'package:meal_planner/data/local/dao/product.dao.dart';
import 'package:meal_planner/data/local/models/product.model.dart';
import 'package:meal_planner/domain/abstract/product.repository.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/utils/result.dart';

final class LocalProductRepository  implements ProductRepository {
  final ProductDAO _productDAO;

  LocalProductRepository({required ProductDAO productDAO}) : _productDAO = productDAO;

  @override
  Future<Result<void>> add(ProductEntity product) async {
    // TODO: implement add
    try {
      final res = await _productDAO.insertProduct(ProductModel.fromEntity(product));
      return Result.ok(res);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    // TODO: implement delete
    try {
      final res =  await _productDAO.deleteProduct(id);
      return Result.ok(res);
    } on Exception catch (e) {
      return Future.value(Result.error(e));
    }
  }

  @override
  Future<Result<List<ProductEntity>>> getAll() async {
    // TODO: implement getAll
    try {
      final res = await _productDAO.findAllProducts();
      return Future.value(Result.ok(res));
    } on Exception catch (e) {
      return Future.value(Result.error(e));
    }
  }

  @override
  Future<Result<ProductEntity>> getById(String id) async {
    // TODO: implement getById
    try {
      final res = await _productDAO.findProductById(id);
      return Future.value(Result.ok(res as ProductEntity));
    } on Exception catch (e) {
      return Future.value(Result.error(e));
    }
  }

  @override
  Future<Result<void>> update(ProductEntity product) async {
    // TODO: implement update
    try {
      final res = await _productDAO.updateProduct(ProductModel.fromEntity(product));
      return Future.value(Result.ok(res));
    } on Exception catch (e) {
      return Future.value(Result.error(e));
    }
  }
  

}