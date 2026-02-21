import 'package:meal_planner/domain/abstract/product.repository.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/domain/useCase/use_case.dart';
import 'package:meal_planner/utils/result.dart';

final class GetByIdUseCase extends UseCase<ProductEntity, int> {
  final ProductRepository _productRepository;

  GetByIdUseCase({required ProductRepository productRepository}) : _productRepository = productRepository;

  @override
  Future<Result<int>> call(ProductEntity input) {
    // TODO: implement call
    throw UnimplementedError();
  }


}