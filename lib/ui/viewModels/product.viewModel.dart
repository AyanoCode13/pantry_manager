import 'package:flutter/foundation.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/domain/useCase/product/add.useCase.dart';
import 'package:meal_planner/domain/useCase/product/delele.useCase.dart';
import 'package:meal_planner/domain/useCase/product/getAll.useCase.dart';
import 'package:meal_planner/domain/useCase/product/getById.useCase.dart';
import 'package:meal_planner/utils/command.dart';
import 'package:meal_planner/utils/result.dart';

final class ProductViewModel extends ChangeNotifier {
  final AddProductUseCase _addProductUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;
  final DeleteProductUseCase _deleteProductUseCase;
  final GetByIdUseCase _getByIdUseCase;

  ProductViewModel({
    required AddProductUseCase addProductUseCase, 
    required GetAllProductsUseCase getAllProductsUseCase,
    required DeleteProductUseCase deleteProductUseCase,
    required GetByIdUseCase getByIdUseCase
  }) : _addProductUseCase = addProductUseCase, 
      _getAllProductsUseCase = getAllProductsUseCase,
      _deleteProductUseCase = deleteProductUseCase,
      _getByIdUseCase = getByIdUseCase {
      load = BasicCommand(_load)..execute();
      add = ComplexCommand(_add);
      
  }
  
  late List<ProductEntity> _products;

  late final BasicCommand load;
  late final ComplexCommand<void, ProductEntity> add;
  List<ProductEntity> get products => _products;
  Future<Result<void>> _load() async {
    try {
      final res = await _getAllProductsUseCase.call(null);
      switch (res) {
        case Ok<List<ProductEntity>>():
          _products = res.value;
        case Error<List<ProductEntity>>():
          Result.error(res.error);
      }
      return res;
    }
    finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _add(ProductEntity product) async {
    try {
      final res = await _addProductUseCase.call(product);
      switch (res) {
        case Ok<ProductEntity>():
          return Result.ok(null);
        case Error<ProductEntity>():
          return Result.error(res.error);
      }
    }
    finally {
      notifyListeners();
    }
  }
}

