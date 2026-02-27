import 'package:floor/floor.dart';
import 'package:meal_planner/domain/entities/recipe.entity.dart';
@Entity(
  tableName: 'recipes',
  primaryKeys: ['id'],
  indices: [
    Index(value: ['id'], unique: true),
    Index(value: ['name'], unique: true),
  ],
)
final class RecipeModel extends RecipeEntity {
  const RecipeModel({required super.id, required super.name, required super.price});

  factory RecipeModel.fromEntity(RecipeEntity entity){
    return RecipeModel(id: entity.id, name: entity.name, price: entity.price);
  }

  RecipeEntity toEntity() {
    return RecipeEntity(id: id, name:name, price: price);
  }
} 