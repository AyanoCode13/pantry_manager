import 'package:meal_planner/data/local/dao/product.dao.dart';
import 'package:meal_planner/data/local/models/product.model.dart';
import 'package:meal_planner/domain/abstract/repository.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/service/file.storage.service.dart';
import 'package:meal_planner/utils/result.dart';

final class LocalProductRepository implements Repository<ProductEntity> {
  final ProductDAO _productDAO;
  final FileStorageService _fileStorageService;

  LocalProductRepository({
    required ProductDAO productDAO,
    required FileStorageService fileStorageService,
  }) : _productDAO = productDAO,
       _fileStorageService = fileStorageService;

  @override
  Future<Result<void>> add(ProductEntity product) async {
    // TODO: implement add
    try {
      late final String imagePath;

      if (product.image != null) {
        imagePath = await _fileStorageService.saveFile(
          product.image!,
          "products/${product.id}",
        );
      }

      print(imagePath);
      final ProductModel productModel = ProductModel(
        id: product.id,
        name: product.name,
        price: product.price,
        quantity: product.quantity,
        image: imagePath,
      );
      print(productModel);
      final res = await _productDAO.insertProduct(productModel);
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
      final res = await _productDAO.deleteProduct(id);
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
      final products = res.map((e) {
        return ProductEntity(
          id: e.id,
          name: e.name,
          price: e.price,
          quantity: e.quantity,
        );
      }).toList();
      return Result.ok(products);
    } on Exception catch (e) {
      return Future.value(Result.error(e));
    }
  }

  @override
  Future<Result<ProductEntity>> getById(String id) async {
    // TODO: implement getById
    try {
      final res = await _productDAO.findProductById(id);
      final image = await _fileStorageService.getFile(
          "products/${res!.id}",
          res.image!,
        );
        print(res.image);
      final ProductEntity product = ProductEntity(
        id: res.id,
        name: res.name,
        price: res.price,
        quantity: res.quantity,
        image: image,
      );
      print(product);

      return Future.value(Result.ok(product));
    } on Exception catch (e) {
      return Future.value(Result.error(e));
    }
  }

  @override
  Future<Result<void>> update(ProductEntity product) async {
    // TODO: implement update
    try {
      final res = await _productDAO.updateProduct(
        ProductModel.fromEntity(product),
      );
      return Future.value(Result.ok(res));
    } on Exception catch (e) {
      return Future.value(Result.error(e));
    }
  }
}
