import 'package:meal_planner/domain/abstract/product.repository.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/domain/useCase/use_case.dart';
import 'package:meal_planner/utils/result.dart';

final class GetAllProductsUseCase implements UseCase<void, List<ProductEntity>> {
  final ProductRepository _productRepository;

  GetAllProductsUseCase({required ProductRepository productRepository}) : _productRepository = productRepository;

  @override
  Future<Result<List<ProductEntity>>> call({required void input}) async {
    return await _productRepository.getAll();
  }
}