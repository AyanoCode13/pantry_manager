import 'package:meal_planner/domain/abstract/product.repository.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/domain/useCase/use_case.dart';
import 'package:meal_planner/utils/result.dart';

final class AddProductUseCase implements UseCase<ProductEntity, ProductEntity> {
  final ProductRepository _productRepository;

  AddProductUseCase({required ProductRepository productRepository}) : _productRepository = productRepository;

  @override
  Future<Result<ProductEntity>> call({ required ProductEntity input}) async {
    final res = await _productRepository.add(input);
    switch (res) {
      case Ok<void>():
        break;
      case Error<void>():
        return Result.error(res.error);
    }
    return Result.ok(input);
  }
}
