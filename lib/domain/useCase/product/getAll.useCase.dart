import 'package:meal_planner/domain/abstract/repository.dart';
import 'package:meal_planner/domain/abstract/use_case.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/utils/result.dart';

final class GetAllProductsUseCase extends UseCase<void, List<ProductEntity>> {
  final Repository<ProductEntity> _repository;

  GetAllProductsUseCase({required Repository<ProductEntity> repository})
    : _repository = repository;

  @override
  Future<Result<List<ProductEntity>>> call({required void input}) async {
    return await _repository.getAll();
  }
}
