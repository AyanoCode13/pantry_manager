import 'package:flutter/foundation.dart';
import 'package:meal_planner/domain/useCase/product/add.useCase.dart';

final class ProductViewModel extends ChangeNotifier {
  final AddProductUseCase _addProductUseCase;

  ProductViewModel({required AddProductUseCase addProductUseCase}) : _addProductUseCase = addProductUseCase;
}