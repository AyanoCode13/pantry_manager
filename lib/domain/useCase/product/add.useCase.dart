import 'package:meal_planner/domain/abstract/product.repository.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/domain/useCase/use_case.dart';
import 'package:meal_planner/utils/result.dart';

final class AddProductUseCase implements UseCase<ProductEntity, void> {
  final ProductRepository _repository;

  AddProductUseCase({required ProductRepository repository}) : _repository = repository;

  @override
  Future<Result<void>> call(ProductEntity input) async {
    return Future.value(Result.ok(null));
  }
}
