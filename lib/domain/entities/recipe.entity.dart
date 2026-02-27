import 'package:meal_planner/domain/abstract/model.dart';
import 'package:meal_planner/domain/dto/recipe/create.recipe.dto.dart';
import 'package:uuid/uuid.dart';

class RecipeEntity extends Model {
  final String name;
  final double price;

  factory RecipeEntity.create({required CreateRecipeDTO dto}) {
    return RecipeEntity(
      id: const Uuid().v4(),
      name: dto.name,
      price: dto.price,
    );
  }

  const RecipeEntity({
    required super.id,
    required this.name,
    required this.price,
  });
  @override
  List<Object?> get props => [id, name];
}
