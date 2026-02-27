import 'dart:io';

import 'package:meal_planner/data/local/dao/product.dao.dart';
import 'package:meal_planner/data/local/models/product.model.dart';
import 'package:meal_planner/domain/abstract/repository.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/service/file.storage.service.dart';
import 'package:meal_planner/utils/result.dart';

final class LocalProductRepository implements Repository<ProductEntity> {
  final ProductDAO _productDAO;
  final FileStorageService _fileStorageService;

  LocalProductRepository({required ProductDAO productDAO, required FileStorageService fileStorageService})
    : _productDAO = productDAO,
      _fileStorageService = fileStorageService;

  @override
  Future<Result<void>> add(ProductEntity product) async {
    // TODO: implement add
    try {
      if (product.image != null) {
        await _fileStorageService.saveFile(product.image!, product.name, "/products/${product.id}");
      }
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
      print("Deleted Product with Id: $id");
      final res =  await _productDAO.deleteProduct(id);
      await _fileStorageService.deleteFiles("/products/$id");
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
      final products = res.map((e) async { 
          final file = await _fileStorageService.getFile("/products/${e.id}", e.name);
          return ProductEntity(
            id: e.id,
            name: e.name,
            price: e.price,
            quantity: e.quantity,
            image: file
          );
        }).toList();
      return Future.value(Result.ok(
        await Future.wait(products)
      ));
    } on Exception catch (e) {
      return Future.value(Result.error(e));
    }
  }

  @override
  Future<Result<ProductEntity>> getById(String id) async {
    // TODO: implement getById
    try {
      final res = await _productDAO.findProductById(id);

      return Future.value(Result.ok(res!.toEntity()));
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