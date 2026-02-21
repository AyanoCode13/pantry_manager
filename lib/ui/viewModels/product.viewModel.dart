import 'package:flutter/foundation.dart';
import 'package:meal_planner/domain/useCase/product/add.useCase.dart';
import 'package:meal_planner/domain/useCase/product/delele.useCase.dart';
import 'package:meal_planner/domain/useCase/product/getAll.useCase.dart';
import 'package:meal_planner/domain/useCase/product/getById.useCase.dart';

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
      _getByIdUseCase = getByIdUseCase;
}