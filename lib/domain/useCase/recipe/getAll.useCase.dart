import 'package:meal_planner/domain/abstract/repository.dart';
import 'package:meal_planner/domain/abstract/use_case.dart';
import 'package:meal_planner/domain/entities/recipe.entity.dart';
import 'package:meal_planner/utils/result.dart';

final class GetAllRecipesUseCase extends UseCase<void, List<RecipeEntity>> {
  final Repository<RecipeEntity> _repository;

  GetAllRecipesUseCase({required Repository<RecipeEntity> repository})
    : _repository = repository;

  @override
  Future<Result<List<RecipeEntity>>> call({required void input}) async {
    return await _repository.getAll();
  }
}
