import 'package:meal_planner/domain/abstract/product.repository.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/domain/useCase/use_case.dart';
import 'package:meal_planner/utils/result.dart';

final class GetByIdUseCase extends UseCase<String, ProductEntity> {
  final ProductRepository _productRepository;

  GetByIdUseCase({required ProductRepository productRepository}) : _productRepository = productRepository;

  @override
  Future<Result<ProductEntity>> call(String input) async {
    try {
      final res = await _productRepository.getById(input);
      return res;
    }
    on Exception catch (e) {
      return Result.error(e);
    }
  }


}