import 'package:meal_planner/domain/abstract/repository.dart';
import 'package:meal_planner/domain/abstract/use_case.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/utils/result.dart';

class DeleteProductUseCase extends UseCase<String, void> {
 final Repository<ProductEntity> _repository;

  DeleteProductUseCase({required Repository<ProductEntity> repository}) : _repository = repository;

  @override
  Future<Result<void>> call({required String input}) async {
    // TODO: implement call
    return await _repository.delete(input);
  }


}